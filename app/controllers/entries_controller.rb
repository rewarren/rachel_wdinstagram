# index
get "/" do
  @entries = Entry.all.order(:id).reverse
  erb :index
end

# new
get "/entries/new" do
  @entry = Entry.new
  erb :new
end

# create
post "/entries" do
  @entry = Entry.new( params[:entry] )
  @entry.update( date_taken: Time.now.strftime("%B %d, %Y") )
  if @entry.save
    redirect "/entries/#{@entry.id}"
  else
    redirect "/entries/new"
  end
end

# edit
get "/entries/:id/edit" do
  @entry = Entry.find( params[:id] )
  erb :edit
end

# update
put "/entries/:id" do
  @entry = Entry.find( params[:id] )
  @entry.update( params[:entry] )
  redirect "/entries/#{@entry.id}"
end

# show
get "/entries/:id" do
  @entry = Entry.find( params[:id] )
  erb :show
end

# delete
delete "/entries/:id" do
  @entry = Entry.find( params[:id] )
  @entry.destroy
  redirect "/"
end
