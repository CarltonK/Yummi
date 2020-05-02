class PizzaModel {
  int id;
  String title;
  int quantity;
  String description;
  double rating;
  double price;
  String imageUrl;

  PizzaModel(
      {this.id,
      this.title,
      this.quantity,
      this.description,
      this.rating,
      this.price,
      this.imageUrl});
}

PizzaModel margTomatoPizza = new PizzaModel(
    id: 1,
    title: 'Margarita with Tomatoes',
    description:
        'Lorem ipsum is simply dummy text of the printing and typesetting industry',
    rating: 4,
    quantity: 1,
    price: 8.99,
    imageUrl:
        'https://images.unsplash.com/photo-1559978137-8c560d91e9e1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80');

PizzaModel naePizza = new PizzaModel(
    id: 2,
    title: 'Naepolitan Pizza',
    description:
        'Lorem ipsum is simply dummy text of the printing and typesetting industry',
    rating: 3,
    quantity: 1,
    price: 6.99,
    imageUrl:
        'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-1.2.1&auto=format&fit=crop&w=714&q=80');

PizzaModel mexGreenPizza = new PizzaModel(
    id: 3,
    title: 'Mexican Green Wave',
    description:
        'Lorem ipsum is simply dummy text of the printing and typesetting industry',
    rating: 4,
    quantity: 1,
    price: 8.49,
    imageUrl:
        'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80');

PizzaModel vegExtraPizza = new PizzaModel(
    id: 4,
    title: 'Veg Extravaganza',
    description:
        'Lorem ipsum is simply dummy text of the printing and typesetting industry',
    rating: 3,
    quantity: 1,
    price: 6.99,
    imageUrl:
        'https://images.unsplash.com/photo-1574126154517-d1e0d89ef734?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80');

PizzaModel vegDisePizza = new PizzaModel(
    id: 5,
    title: 'Veggie Paradise',
    description:
        'Lorem ipsum is simply dummy text of the printing and typesetting industry',
    rating: 4,
    quantity: 1,
    price: 9.99,
    imageUrl:
        'https://images.unsplash.com/photo-1552539618-7eec9b4d1796?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=733&q=80');

PizzaModel hawPizza = new PizzaModel(
    id: 6,
    title: 'Hawaiian',
    description:
        'Lorem ipsum is simply dummy text of the printing and typesetting industry',
    rating: 4,
    quantity: 1,
    price: 10.99,
    imageUrl:
        'https://images.unsplash.com/photo-1528137871618-79d2761e3fd5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80');

PizzaModel carbPizza = new PizzaModel(
    id: 7,
    title: 'Carbonera',
    description:
        'Lorem ipsum is simply dummy text of the printing and typesetting industry',
    rating: 4,
    quantity: 1,
    price: 9.99,
    imageUrl:
        'https://images.unsplash.com/photo-1545016803-a7e357a737e4?ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80');

PizzaModel pepPizza = new PizzaModel(
    id: 8,
    title: 'Pepperoni',
    description:
        'Lorem ipsum is simply dummy text of the printing and typesetting industry',
    rating: 4,
    quantity: 1,
    price: 9.99,
    imageUrl:
        'https://images.unsplash.com/photo-1506354666786-959d6d497f1a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjExMDk0fQ&auto=format&fit=crop&w=1050&q=80');

PizzaModel beefPizza = new PizzaModel(
    id: 9,
    title: 'Beef Casserole',
    description:
        'Lorem ipsum is simply dummy text of the printing and typesetting industry',
    rating: 4,
    quantity: 1,
    price: 9.99,
    imageUrl:
        'https://images.unsplash.com/photo-1552539618-7eec9b4d1796?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=733&q=80');

PizzaModel mozPizza = new PizzaModel(
    id: 10,
    title: 'Mozarella',
    description:
        'Lorem ipsum is simply dummy text of the printing and typesetting industry',
    rating: 4,
    quantity: 1,
    price: 9.99,
    imageUrl:
        'https://images.unsplash.com/photo-1566843972142-a7fcb70de55a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80');

List<PizzaModel> pizzas = [
  margTomatoPizza,
  naePizza,
  mexGreenPizza,
  vegExtraPizza,
  vegDisePizza,
  hawPizza,
  carbPizza,
  pepPizza,
  beefPizza,
  mozPizza
];
