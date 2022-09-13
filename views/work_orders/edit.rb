<h1>Edit Food</h1>
<form action="/foods/<%= food['id'] %>" method="POST">
    <input type="hidden" name="_method" value="put">

    <label for="">name: </label>
    <input type="text" name="name" value="<%= food['name']%>">

    <label for="">Image URL: </label>
    <input type="text" name="image_url" value="<%= food['image_url']%>">

    <button>Update food</button>
</form>