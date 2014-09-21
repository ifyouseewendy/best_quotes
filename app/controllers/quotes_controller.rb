class QuotesController < Rulers::Controller
  def index
    @quotes = FileModel.all
  end

  def show
    @quote = FileModel.find(params['id'])
    @ua = request.user_agent
    render_response :quote
  end

  def a_quote
    render :a_quote, :noun => :winking
  end

  def quote_1
    quote_1 = FileModel.find(1)
    render :quote, :obj => quote_1
  end

  def new_quote
    attrs = {
      "submitter" => "web user",
      "quote" => "A picture is worth one k pixels",
      "attribution" => "Me"
    }
    m = FileModel.create attrs
    render :quote, :obj => m
  end

  def exception
    raise "It's a bad one!"
  end

end
