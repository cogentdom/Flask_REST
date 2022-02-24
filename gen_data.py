from main import db
db.create_all()
from main import Drink
drink = Drink(name="Soda", description="Taste like grape")
db.session.add(drink)
db.session.commit()
db.session.add(Drink(name='Water', description='The healthy option'))
db.session.commit()
db.session.add(Drink(name='Beer', description='Im guessing it is the weekend'))
db.session.commit()
db.session.add(Drink(name='Milk', description='Cows go Moo'))
db.session.commit()
exit()