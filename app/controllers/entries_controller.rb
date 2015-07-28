# index
def index
  @entries = Entry.all.order(:id).reverse
end

# new
def new
  @entry = Entry.new
end

# create
def create
  @entry = Entry.new( params[:entry] )
  @entry.update( date_taken: Time.now.strftime("%B %d, %Y") )
  if @entry.save
    redirect_to "/entries/#{@entry.id}"
  else
    redirect_to "/entries/new"
  end
end

# edit
def edit
  @entry = Entry.find( params[:id] )
end

# update
def update
  @entry = Entry.find( params[:id] )
  @entry.update( params[:entry] )
  redirect_to "/entries/#{@entry.id}"
end

# show
def show
  @entry = Entry.find( params[:id] )
end

# delete
def delete
  @entry = Entry.find( params[:id] )
  @entry.destroy
  redirect "/"
end
