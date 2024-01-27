from random import randint

truenumber = randint(1, 1000)

running = True

while running:
    number = int(input("Entrez le nombre"))
    if number == truenumber:
        print("vous avez trouver !")
        running = False
    else:
        if number > truenumber:
            print("c'est moins")
        else:
            print("c'est plus")
