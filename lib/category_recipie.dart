import 'package:flutter/material.dart';
import 'category.dart';
import 'recipie.dart';

const Category_recipie = const [
  Category(id: 'c1', title: 'Pastries', image: 'Images/pastry.jpg'),
  Category(id: 'c2', title: 'Desserts', image: 'Images/deserts.jpg'),
  Category(id: 'c3', title: 'Festive Rice', image: 'Images/indonesian.jpg'),
  Category(id: 'c4', title: 'Cup Cakes', image: 'Images/cupcake.jpg'),
  Category(id: 'c5', title: 'Cakes Festival', image: 'Images/cakes.jpg'),
  Category(id: 'c6', title: 'Chinese Cookery', image: 'Images/chinese.jpg'),
];
const Recipie_meals = const[
  Recipie(recipieid: 'm1',title: 'Buns',categoryid: 'c1',categoryimg: 'Images/pastry.jpg',recipieimg: [
    'Images/bun3.jpg',
    'Images/bun2.jpg',
    'Images/bun4.jpg',
    'Images/bun5.jpg',
    'Images/bun6.jpg',
  ],duration: 2,isPurchased: false,recipie: 'assets/Buns.pdf'),
  Recipie(recipieid: 'm2',title: 'Pastries',categoryid: 'c1',categoryimg: 'Images/pas1.jpg',recipieimg: [
    'Images/pas1.jpg',
    'Images/pas2.jpg',
    'Images/pas3.jpg',
  ],duration: 2,isPurchased: false,recipie: 'assets/Puff.pdf'),
  Recipie(recipieid: 'm3',title: 'Pizzas',categoryid: 'c1',categoryimg: 'Images/piz4.jpg',recipieimg: [
    'Images/piz6.jpg',
    'Images/piz2.jpg',
    'Images/piz3.jpg',
    'Images/piz4.jpg',
    'Images/piz5.jpg',
  ],duration: 3,isPurchased: false,recipie: 'assets/Pizza.pdf'),
  Recipie(recipieid: 'm4',title: 'Eclairs',categoryid: 'c1',categoryimg: 'Images/eclair.jpg',recipieimg: [
    'Images/eclair1.jpg',
    'Images/eclair2.jpg',
    'Images/eclair3.jpg',
  ],duration: 2,isPurchased: false,recipie: 'assets/Eclairs.pdf'),
  Recipie(recipieid: 'm5',title: 'Donuts',categoryid: 'c1',categoryimg: 'Images/donut2.jpg',recipieimg: [
    'Images/donut1.jpg',
    'Images/donut2.jpg',
    'Images/donut3.jpg',
  ],duration: 2,isPurchased: false,recipie: 'assets/Donuts.pdf'),
  Recipie(recipieid: 'm6',title: 'Burgers',categoryid: 'c1',categoryimg: 'Images/bun1.jpg',recipieimg: [
    'Images/bun1.jpg',
    'Images/burger1.jpg',
    'Images/burger2.jpg',
  ],duration: 3,isPurchased: false,recipie: 'assets/Burgers.pdf'),
  Recipie(recipieid: 'm7',title: 'Tarts',categoryid: 'c1',categoryimg: 'Images/tart1.jpg',recipieimg: [
    'Images/tart1.jpg',
    'Images/tart2.jpg',
    'Images/tart3.jpg',
    'Images/tart4.jpg',
  ],duration: 3,isPurchased: false,recipie: 'assets/Tarts.pdf'),
  Recipie(recipieid: 'm8',title: 'Strawberry \nGateux',categoryid: 'c2',categoryimg: 'Images/straw1.jpg',recipieimg: [
    'Images/straw1.jpg',
    'Images/straw2.jpg',
    'Images/des1.jpg',
  ],duration: 3,isPurchased: false,recipie: 'assets/Buns.pdf'),
  Recipie(recipieid: 'm9',title: 'Chocolate \nGateux',categoryid: 'c2',categoryimg: 'Images/gat1.jpg',recipieimg: [
    'Images/gat1.jpg',
    'Images/gat2.jpg',
    'Images/gat3.jpg',
    'Images/gat4.jpg',
  ],duration: 3,isPurchased: false,recipie: 'assets/Chocolate Gateux.pdf'),
  Recipie(recipieid: 'm10',title: 'Chocolate \nMoose',categoryid: 'c2',categoryimg: 'Images/moose1.jpg',recipieimg: [
    'Images/moose1.jpg',
    'Images/gat3.jpg',
    'Images/deserts.jpg',
  ],duration: 2,isPurchased: false,recipie: 'assets/Buns.pdf'),
  Recipie(recipieid: 'm11',title: 'Fruit \nTriffle',categoryid: 'c2',categoryimg: 'Images/fruit1.jpg',recipieimg: [
    'Images/fruit1.jpg',
    'Images/fruit2.jpg',
  ],duration: 3,isPurchased: false,recipie: 'assets/Fruit Triffle.pdf'),
  Recipie(recipieid: 'm12',title: 'Baked Alaska',categoryid: 'c2',categoryimg: 'Images/baked1.jpg',recipieimg: [
    'Images/baked1.jpg',
    'Images/baked2.jpg',
  ],duration: 3,isPurchased: false,recipie: 'assets/Baked Alaska.pdf'),
  Recipie(recipieid: 'm13',title: 'Indonesian \nCuisines',categoryid: 'c3',categoryimg: 'Images/indonesian.jpg',recipieimg: [
    'Images/indo1.jpg',
    'Images/indo2.jpg',
    'Images/indo3.jpg',
    'Images/indonesian.jpg',
  ],duration: 4,isPurchased: false,recipie: 'assets/Indonesian.pdf'),
  Recipie(recipieid: 'm14',title: 'Italian \nCuisines',categoryid: 'c3',categoryimg: 'Images/ita1.jpg',recipieimg: [
    'Images/ita2.jpg',
    'Images/ita3.jpg',
    'Images/ita4.jpg',
    'Images/ita5.jpg',
    'Images/ita1.jpg',
  ],duration: 4,isPurchased: false,recipie: 'assets/Italian.pdf'),
  Recipie(recipieid: 'm15',title: 'Pakistan \nCuisines',categoryid: 'c3',categoryimg: 'Images/pak1.jpg',recipieimg: [
    'Images/pak2.jpg',
    'Images/pak1.jpg',
    'Images/pak3.jpg',
  ],duration: 4,isPurchased: false,recipie: 'assets/Pakistan.pdf'),
  Recipie(recipieid: 'm16',title: 'Middle Eastern\nCuisines ',categoryid: 'c3',categoryimg: 'Images/mid3.jpg',recipieimg: [
    'Images/mid1.jpg',
    'Images/shaw1.jpg',
    'Images/mid2.jpg',
    'Images/mid3.jpg',
  ],duration: 4,recipie: 'assets/Buns.pdf',isPurchased: false),
  Recipie(recipieid: 'm17',title: 'Raibow Cupcake',categoryid: 'c4',categoryimg: 'Images/rainbow1.jpg',recipieimg: [
    'Images/rainbow1.jpg',
    'Images/rainbow2.jpg',
    'Images/rainbow3.jpg',
  ],duration: 3,isPurchased: false,recipie: 'assets/Rainbow.pdf'),
  Recipie(recipieid: 'm18',title: 'Red Velvet \nCupcake',categoryid: 'c4',categoryimg: 'Images/red1.jpg',recipieimg: [
    'Images/red1.jpg',
    'Images/red2.jpg',
    'Images/red3.jpg',
  ],duration: 3,isPurchased: false,recipie: 'assets/Red Velevet.pdf'),
  Recipie(recipieid: 'm19',title: 'Warm White \nCupcake ',categoryid: 'c4',categoryimg: 'Images/warm1.jpg',recipieimg: [
    'Images/warm1.jpg',
    'Images/warm2.jpg',
  ],duration: 3,isPurchased: false,recipie: 'assets/WarmWhite.pdf'),
  Recipie(recipieid: 'm20',title: 'Choco-Chip \nCupcake',categoryid: 'c4',categoryimg: 'Images/chochip1.jpg',recipieimg: [
    'Images/chochip1.jpg',
  ],duration: 3,isPurchased: false,recipie: 'assets/Choc Chip.pdf'),
  Recipie(recipieid: 'm21',title: 'Chocolate Brownie\nCupcake ',categoryid: 'c4',categoryimg: 'Images/brownie1.jpg',recipieimg: [
    'Images/brownie1.jpg',
    'Images/brownie2.jpg',
    'Images/chochip1.jpg',
  ],duration: 3,isPurchased: false,recipie: 'assets/Brownie.pdf'),
  Recipie(recipieid: 'm22',title: 'Coffee Parasinia\nCupacke',categoryid: 'c4',categoryimg: 'Images/cof1.jpg',recipieimg: [
    'Images/cof1.jpg',
    'Images/cof2.jpg',
  ],duration: 3,isPurchased: false,recipie: 'assets/Cafe Parasenia.pdf'),
  Recipie(recipieid: 'm23',title: 'Chocolate \nSacchey Cake',categoryid: 'c5',categoryimg: 'Images/choc1.jpg',recipieimg: [
    'Images/choc1.jpg',
    'Images/choc2.jpg',
    'Images/choc3.jpg',
  ],duration: 3,isPurchased: false,recipie: 'assets/Sacchet.pdf'),
  Recipie(recipieid: 'm24',title: 'Lindzer \nCake',categoryid: 'c5',categoryimg: 'Images/linz1.jpg',recipieimg: [
    'Images/linz1.jpg',
    'Images/linz2.jpg',
    'Images/linz3.jpg',
    'Images/linz4.jpg',
  ],duration: 3,isPurchased: false,recipie: 'assets/Lidzer.pdf'),
  Recipie(recipieid: 'm25',title: 'ShortCrust \nPastry',categoryid: 'c1',categoryimg: 'Images/short1.jpg',recipieimg: [
    'Images/short2.jpg',
    'Images/short3.jpg',
    'Images/short1.jpg',
  ],duration: 2,isPurchased: false,recipie: 'assets/ShortCrust.pdf'),
  Recipie(recipieid: 'm26',title: 'Tofee Pound \nCake',categoryid: 'c5',categoryimg: 'Images/tof1.jpg',recipieimg: [
    'Images/tof1.jpg',
    'Images/tof2.jpg',
    'Images/tof3.jpg',
    'Images/cakes.jpg',
  ],duration: 3,isPurchased: false,recipie: 'assets/Tofee Pound.pdf'),
  Recipie(recipieid: 'm27',title: 'Swiss Roll \nCake',categoryid: 'c5',categoryimg: 'Images/cake1.jpg',recipieimg: [
    'Images/cake1.jpg',
  ],duration: 3,isPurchased: false,recipie: 'assets/Swissrole.pdf'),
  Recipie(recipieid: 'm28',title: 'Noughat Cake',categoryid: 'c5',categoryimg: 'Images/nog1.jpg',recipieimg: [
    'Images/nog1.jpg',
  ],duration: 3,isPurchased: false,recipie: 'assets/Noughat.pdf'),
  Recipie(recipieid: 'm29',title: 'Mixed Fried \nRice',categoryid: 'c6',categoryimg: 'Images/mix1.jpg',recipieimg: [
    'Images/mix1.jpg',
    'Images/mix2.jpg',
    'Images/mix3.jpg',
    'Images/sea1.jpg',
  ],duration: 4,isPurchased: false,recipie: 'assets/Mixed Fried Rice.pdf'),
  Recipie(recipieid: 'm30',title: 'Spicy Garlic \nChicken Fried Rice',categoryid: 'c6',categoryimg: 'Images/spicy1.jpg',recipieimg: [
    'Images/spicy1.jpg',
    'Images/spicy2.jpg',
    'Images/spicy3.jpg',
    'Images/spicy4.jpg',
    'Images/spicy5.jpg',
  ],duration: 4,isPurchased: false,recipie: 'assets/Spicy Garlic.pdf'),



];

 const Hot_picks = const[
   Recipie(recipieid: 'm3',title: 'Pizzas',categoryid: 'c1',categoryimg: 'Images/piz4.jpg',recipieimg: [
     'Images/piz6.jpg',
     'Images/piz2.jpg',
     'Images/piz3.jpg',
     'Images/piz4.jpg',
     'Images/piz5.jpg',
   ],duration: 3,isPurchased: false,recipie: 'assets/Pizza.pdf'),
   Recipie(recipieid: 'm4',title: 'Eclairs',categoryid: 'c1',categoryimg: 'Images/eclair.jpg',recipieimg: [
     'Images/eclair1.jpg',
     'Images/eclair2.jpg',
     'Images/eclair3.jpg',
   ],duration: 2,isPurchased: false,recipie: 'assets/Eclairs.pdf'),
   Recipie(recipieid: 'm5',title: 'Donuts',categoryid: 'c1',categoryimg: 'Images/donut2.jpg',recipieimg: [
     'Images/donut1.jpg',
     'Images/donut2.jpg',
     'Images/donut3.jpg',
   ],duration: 2,isPurchased: false,recipie: 'assets/Donuts.pdf'),
   Recipie(recipieid: 'm6',title: 'Burgers',categoryid: 'c1',categoryimg: 'Images/bun1.jpg',recipieimg: [
     'Images/bun1.jpg',
     'Images/burger1.jpg',
     'Images/burger2.jpg',
   ],duration: 3,isPurchased: false,recipie: 'assets/Burgers.pdf'),
   Recipie(recipieid: 'm8',title: 'Strawberry \nGateux',categoryid: 'c2',categoryimg: 'Images/straw1.jpg',recipieimg: [
     'Images/straw1.jpg',
     'Images/straw2.jpg',
     'Images/des1.jpg',
   ],duration: 3,isPurchased: false,recipie: 'assets/Buns.pdf'),
   Recipie(recipieid: 'm9',title: 'Chocolate \nGateux',categoryid: 'c2',categoryimg: 'Images/gat1.jpg',recipieimg: [
     'Images/gat1.jpg',
     'Images/gat2.jpg',
     'Images/gat3.jpg',
     'Images/gat4.jpg',
   ],duration: 3,isPurchased: false,recipie: 'assets/Chocolate Gateux.pdf'),
   Recipie(recipieid: 'm12',title: 'Baked Alaska',categoryid: 'c2',categoryimg: 'Images/baked1.jpg',recipieimg: [
     'Images/baked1.jpg',
     'Images/baked2.jpg',
   ],duration: 3,isPurchased: false,recipie: 'assets/Baked Alaska.pdf'),
   Recipie(recipieid: 'm13',title: 'Indonesian \nCuisines',categoryid: 'c3',categoryimg: 'Images/indonesian.jpg',recipieimg: [
     'Images/indo1.jpg',
     'Images/indo2.jpg',
     'Images/indo3.jpg',
     'Images/indonesian.jpg',
   ],duration: 4,isPurchased: false,recipie: 'assets/Indonesian.pdf'),
   Recipie(recipieid: 'm14',title: 'Italian \nCuisines',categoryid: 'c3',categoryimg: 'Images/ita1.jpg',recipieimg: [
     'Images/ita2.jpg',
     'Images/ita3.jpg',
     'Images/ita4.jpg',
     'Images/ita5.jpg',
     'Images/ita1.jpg',
   ],duration: 4,isPurchased: false,recipie: 'assets/Italian.pdf'),
   Recipie(recipieid: 'm15',title: 'Pakistan \nCuisines',categoryid: 'c3',categoryimg: 'Images/pak1.jpg',recipieimg: [
     'Images/pak2.jpg',
     'Images/pak1.jpg',
     'Images/pak3.jpg',
   ],duration: 4,isPurchased: false,recipie: 'assets/Pakistan.pdf'),
   Recipie(recipieid: 'm16',title: 'Middle Eastern\nCuisines ',categoryid: 'c3',categoryimg: 'Images/mid3.jpg',recipieimg: [
     'Images/mid1.jpg',
     'Images/shaw1.jpg',
     'Images/mid2.jpg',
     'Images/mid3.jpg',
   ],duration: 4,recipie: 'assets/Buns.pdf',isPurchased: false),
   Recipie(recipieid: 'm23',title: 'Chocolate \nSacchey Cake',categoryid: 'c5',categoryimg: 'Images/choc1.jpg',recipieimg: [
     'Images/choc1.jpg',
     'Images/choc2.jpg',
     'Images/choc3.jpg',
   ],duration: 3,isPurchased: false,recipie: 'assets/Sacchet.pdf'),
   Recipie(recipieid: 'm24',title: 'Lindzer \nCake',categoryid: 'c5',categoryimg: 'Images/linz1.jpg',recipieimg: [
     'Images/linz1.jpg',
     'Images/linz2.jpg',
     'Images/linz3.jpg',
     'Images/linz4.jpg',
   ],duration: 3,isPurchased: false,recipie: 'assets/Lidzer.pdf'),
   Recipie(recipieid: 'm27',title: 'Swiss Roll \nCake',categoryid: 'c5',categoryimg: 'Images/cake1.jpg',recipieimg: [
     'Images/cake1.jpg',
   ],duration: 3,isPurchased: false,recipie: 'assets/Swissrole.pdf'),
   Recipie(recipieid: 'm28',title: 'Noughat Cake',categoryid: 'c5',categoryimg: 'Images/nog1.jpg',recipieimg: [
     'Images/nog1.jpg',
   ],duration: 3,isPurchased: false,recipie: 'assets/Noughat.pdf'),
   Recipie(recipieid: 'm29',title: 'Mixed Fried \nRice',categoryid: 'c6',categoryimg: 'Images/mix1.jpg',recipieimg: [
     'Images/mix1.jpg',
     'Images/mix2.jpg',
     'Images/mix3.jpg',
     'Images/sea1.jpg',
   ],duration: 4,isPurchased: false,recipie: 'assets/Mixed Fried Rice.pdf'),
   Recipie(recipieid: 'm30',title: 'Spicy Garlic \nChicken Fried Rice',categoryid: 'c6',categoryimg: 'Images/spicy1.jpg',recipieimg: [
     'Images/spicy1.jpg',
     'Images/spicy2.jpg',
     'Images/spicy3.jpg',
     'Images/spicy4.jpg',
     'Images/spicy5.jpg',
   ],duration: 4,isPurchased: false,recipie: 'assets/Spicy Garlic.pdf'),

];