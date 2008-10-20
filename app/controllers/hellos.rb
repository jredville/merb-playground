class Hellos < Application
  # provides :xml, :yaml, :js

  def index
    @hellos = Hello.all
    display @hellos
  end

  def show(id)
    @hello = Hello.get(id)
    raise NotFound unless @hello
    display @hello
  end

  def new
    only_provides :html
    @hello = Hello.new
    display Hello
  end

  def edit(id)
    only_provides :html
    @hello = Hello.get(id)
    raise NotFound unless @hello
    display @hello
  end

  def create(hello)
    @hello = Hello.new(params[:hello])
    if @hello.save
      redirect resource(@hello), :message => {:notice => "Hello was successfully created"}
    else
      render :new
    end
  end

  def update(hello)
    @hello = Hello.get(hello[:id] )
    raise NotFound unless @hello
    if @hello.update_attributes(hello)
       redirect resource(@hello)
    else
      display @hello, :edit
    end
  end

  def destroy(id)
    @hello = Hello.get(id)
    raise NotFound unless @hello
    if @hello.destroy
      redirect resource(@hellos)
    else
      raise InternalServerError
    end
  end

end # Hellos
