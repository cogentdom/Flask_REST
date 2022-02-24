from application import db
db.create_all()
from application import Drink
drink = Drink(name="Grape Soda", description="Taste like grape")
db.session.add(drink)
db.session.commit()
db.session.add(Drink(name='Cherry', description='Tastes like Cola'))
db.session.commit()
exit()