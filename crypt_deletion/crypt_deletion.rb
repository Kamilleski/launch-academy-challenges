extra = ["container of beer", "Lionel model train set", "Ingraham pocket watch"]
crypt_of_civilization = ["Comptometer", "box of phonographic records", "plastic savings bank", "set of scales", "Toast-O-Lator", "sample of aluminum foil", "Donald Duck doll"]
crypt_of_civilization += extra

crypt_of_civilization.shift
crypt_of_civilization.delete("set of scales")
crypt_of_civilization.delete("sample of aluminum foil")
puts crypt_of_civilization
