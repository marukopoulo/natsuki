class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    #@posts = Post.all
    @posts = Post.all
  end

  def main
    @firstPost = Post.where.not(send_count: 0).order("id DESC").first
    @posts = Post.page(params[:page]).where.not(send_count: 0).order("id DESC")
    #now = Time.current
    #@posts = Post.where.(send_date: now.beginning_of_day)
  end

  def past
    @posts = Post.page(params[:page]).where.not(send_count: 0).order("id DESC")
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  def sendMail
    @post = Post.where(send_count: 0).first
    if PostMailer.post_email("natsukihara87@gmail.com", @post).deliver
    @post.send_count  = @post.send_count + 1
    @post.send_date = Date.today
    @post.save
    logger = Logger.new('log/sendMail.log')
    logger.info "#{Time.now} -- send mail. -- send to #{@post.name} and content is #{@post.content}"
   end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name, :content,:send_count,:send_date)
    end
end
