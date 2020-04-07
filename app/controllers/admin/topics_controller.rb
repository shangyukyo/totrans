class Admin::TopicsController < Admin::BaseController 
  before_action :find_topic, only: [:edit, :update, :show]
  
  def index 
    @topics = Topic      
      .order('id desc')
      .paginate(page: params[:page], per_page: 15)   
  end

  def new
    @topic = current_user.topics.build
  end

  def create
    @topic = current_user.topics.build(topic_params)
    @topic.save!
    redirect_to admin_root_path
  end

  def edit    
  end

  def update    
    @topic.update_attributes!(topic_params)
    redirect_to admin_root_path    
  end

  def upload    
    
    origin_path = params[:upload_file].path    
    ext = File.extname(origin_path)
    img_name = "#{Time.now.to_i}#{rand(1000)}#{ext}"
    relative_path = "/uploads/#{img_name}"

    dir = Rails.root.join("public/uploads")
    img_path = File.join(dir, img_name)
    data = File.read(origin_path)

    img = File.open(img_path, "wb") do |i|
      i.write data
    end

    render json: { success: true, file_path: relative_path }    
  end

  protected

  def find_topic
    @topic = current_user.topics.find params[:id]
  end

  def topic_params
    params.permit(:title, :slug, :sort_number, :body, :seo_title, :seo_keywords, :seo_description)
  end  
end