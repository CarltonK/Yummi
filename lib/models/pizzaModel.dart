class PizzaModel {
  String title;
  String description;
  double rating;
  double price;
  String imageUrl;

  PizzaModel(
      {this.title, this.description, this.rating, this.price, this.imageUrl});
}

PizzaModel margTomatoPizza = new PizzaModel(
    title: 'Margarita with Tomatoes',
    description:
        'Lorem ipsum is simply dummy text of the printing and typesetting industry',
    rating: 4,
    price: 900,
    imageUrl:
        'https://images.unsplash.com/photo-1559978137-8c560d91e9e1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80');

PizzaModel naePizza = new PizzaModel(
    title: 'Naepolitan Pizza',
    description:
        'Lorem ipsum is simply dummy text of the printing and typesetting industry',
    rating: 3,
    price: 700,
    imageUrl:
        'https://images.unsplash.com/photo-1559978137-8c560d91e9e1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80');

PizzaModel mexGreenPizza = new PizzaModel(
    title: 'Mexican Green Wave',
    description:
        'Lorem ipsum is simply dummy text of the printing and typesetting industry',
    rating: 4,
    price: 850,
    imageUrl:
        'https://images.unsplash.com/photo-1559978137-8c560d91e9e1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80');

PizzaModel vegExtraPizza = new PizzaModel(
    title: 'Veg Extravaganza',
    description:
        'Lorem ipsum is simply dummy text of the printing and typesetting industry',
    rating: 3,
    price: 700,
    imageUrl:
        'https://images.unsplash.com/photo-1559978137-8c560d91e9e1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80');

PizzaModel vegDisePizza = new PizzaModel(
    title: 'Veggie Paradise',
    description:
        'Lorem ipsum is simply dummy text of the printing and typesetting industry',
    rating: 4,
    price: 1000,
    imageUrl:
        'https://images.unsplash.com/photo-1559978137-8c560d91e9e1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80');

List<PizzaModel> pizzas = [
  margTomatoPizza,
  naePizza,
  mexGreenPizza,
  vegExtraPizza,
  vegDisePizza
];
