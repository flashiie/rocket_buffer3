local users = {} -- como se fosse nosso banco de dados.


local loggedAs


--@params:
-- username: string
--@return: boolean
local function exists(username)
  return table.find(users, function (value)
    return value.username == username
  end)
end


--@params:
-- username: string
-- password: string
-- age: number
--@return: boolean
function create( email, username, password)
  if (type(email) ~= "string" and type(username) ~= "string" and type(password) ~= "string") then
    return false
  end

  if (exists(username)) then
    return print("Usuário já existente, tente outro.")
  end

  -- insert user account into db.
  table.insert(users, {email = email, username = username, password = password, ammount = 0})

  return print("Usuário criado com sucesso.")
end




--@params:
--username: string
--password: string
--@return: user_data
function signIn(username, password)
  if (type(username) ~= "string" and type(password) ~= "string") then
    return false
  end


  local exists = exists(username)

  if (not exists) then
    return print("Usuário não existe no banco de dados.")
  end

  local account = users[exists]

  if (account.password ~= password) then
    return print("As senhas não são identicas.")
  end


  loggedAs = account.username

  return print("Seja bem vindo: "..account.username.. "Seu saldo é: R$"..account.ammount)
end




--@params:
--username: string
--@return: boolean
local function deleteUser(username)
  if (type(username) ~= "string") then
    return false
  end

  local exists = exists(username)

  if (not exists) then
    return print("Usuário não existe no banco de dados.")
  end

  local account = users[exists]

  account = nil
  users[exists] = nil

  return true
end


function logout()
  if (not loggedAs) then
    return
  end

  deleteUser(loggedAs)
  iprint("Usuário: "..loggedAs.. " saiu do sistema.")

  loggedAs = nil
end

function getUsers()
  return #users
end
