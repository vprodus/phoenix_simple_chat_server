1. Creare app with the command  
```
mix phx.new simple_chat_server --no-html  
```

2. Setup the data model  
```
mix phx.gen.context Chat Message messages content room_id:id  
mix phx.gen.context Chat Room rooms desc name  
mix phx.gen.context Chat Message messages content room_id:references:rooms  
mix ecto.migrate  
```
3. Make changes to the generated files  

4. Generate room channel  
```
mix phx.gen.channel Room  
```
make changes to the channel Room  

5. Now I used the follwoing commands to create JSON API and replace data model  
```
mix phx.gen.json Chat Room rooms desc name  
mix phx.gen.json Chat Message messages content room_id:references:rooms  
```