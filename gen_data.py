from main import db
db.create_all()
from main import Drink
drink = Drink(name="Grape Soda", description="Taste like grape")
db.session.add(drink)
db.session.commit()
db.session.add(Drink(name='Cherry', description='Tastes like Cola'))
db.session.commit()
exit()