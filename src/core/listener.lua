addCommandHandler("bank_create", function (_, email, username, password)
  create(email, username, password)
end)


addCommandHandler("bank_login", function (_, username, password)
  signIn(username, password)
end)
