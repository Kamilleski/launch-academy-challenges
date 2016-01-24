extra = ["container of beer", "Lionel model train set", "Ingraham pocket watch"]
crypt_of_civilization = ["Comptometer", "box of phonographic records", "plastic savings bank", "set of scales", "Toast-O-Lator", "sample of aluminum foil", "Donald Duck doll"]
crypt_of_civilization += extra
counter = 0

while counter < crypt_of_civilization.length do
  puts crypt_of_civilization[counter]
  counter += 1
end

crypt_of_civilization.each do |item|
  puts item
end
