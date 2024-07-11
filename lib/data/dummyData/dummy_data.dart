import 'package:football_app/features/pitch/models/banner_model.dart';
import 'package:football_app/features/pitch/models/brand_model.dart';
import 'package:football_app/features/pitch/models/catagory_model.dart';
import 'package:football_app/features/pitch/models/product_attribute_model.dart';
import 'package:football_app/features/pitch/models/product_model.dart';
import 'package:football_app/features/pitch/models/product_variation_model.dart';
import 'package:football_app/routes/routes.dart';
import 'package:football_app/utils/constants/image_strings.dart';

class TDummyData {
  //list of all catagories
  static final List<CatagoryModel> catagories = [
    CatagoryModel(
        id: "1",
        name: "Sports",
        image: TImageStrings.sportIcon,
        isFeatured: true),
    CatagoryModel(
        id: "5",
        name: "Furniture",
        image: TImageStrings.furnitureIcon,
        isFeatured: true),
    CatagoryModel(
        id: "2",
        name: "Electronics",
        image: TImageStrings.electronicsIcon,
        isFeatured: true),
    CatagoryModel(
        id: "3",
        name: "Clothes",
        image: TImageStrings.clothIcon,
        isFeatured: true),
    CatagoryModel(
        id: "4",
        name: "Animals",
        image: TImageStrings.animalIcon,
        isFeatured: true),
    CatagoryModel(
        id: "6",
        name: "Shoes",
        image: TImageStrings.shoesIcon,
        isFeatured: true),
    CatagoryModel(
        id: "7",
        name: "Cosmetics",
        image: TImageStrings.cosmeticsIcon,
        isFeatured: true),
    CatagoryModel(
        id: "14",
        name: "Jewelery",
        image: TImageStrings.jewleryIcon,
        isFeatured: true),
    //sub catagories
    CatagoryModel(
        id: "8",
        name: "Sport Shoes",
        image: TImageStrings.sportIcon,
        isFeatured: false,
        parentId: "1"),
    CatagoryModel(
        id: "9",
        name: "Track Suits",
        image: TImageStrings.sportIcon,
        isFeatured: false,
        parentId: "1"),
    CatagoryModel(
        id: "10",
        name: "Sport Equipements",
        image: TImageStrings.sportIcon,
        isFeatured: false,
        parentId: "1"),
    //Furniture
    CatagoryModel(
        id: "11",
        name: "Bedroom Furniture",
        image: TImageStrings.furnitureIcon,
        isFeatured: false,
        parentId: "5"),
    CatagoryModel(
        id: "12",
        name: "Kitchen Furniture",
        image: TImageStrings.furnitureIcon,
        isFeatured: false,
        parentId: "5"),
    CatagoryModel(
        id: "13",
        name: "Office Furniture",
        image: TImageStrings.furnitureIcon,
        isFeatured: false,
        parentId: "5"),
    //electronics
    CatagoryModel(
        id: "15",
        name: "Mobile",
        image: TImageStrings.electronicsIcon,
        isFeatured: false,
        parentId: "2"),
    CatagoryModel(
        id: "16",
        name: "Laptops",
        image: TImageStrings.electronicsIcon,
        isFeatured: false,
        parentId: "2"),
  ];

  //list of all banners
  static final List<BannerModel> banners = [
    BannerModel(
        active: false,
        imageUrl: TImageStrings.promo1,
        targetScreen: TRoutes.order),
    BannerModel(
        active: true,
        imageUrl: TImageStrings.promo2,
        targetScreen: TRoutes.cart),
    BannerModel(
        active: true,
        imageUrl: TImageStrings.promo3,
        targetScreen: TRoutes.favoriates),
    BannerModel(
        active: true,
        imageUrl: TImageStrings.promo4,
        targetScreen: TRoutes.search),
    BannerModel(
        active: true,
        imageUrl: TImageStrings.promo5,
        targetScreen: TRoutes.settings),
    BannerModel(
        active: false,
        imageUrl: TImageStrings.promo6,
        targetScreen: TRoutes.userAddress),
  ];

  static final List<ProductModel> products = [
    ProductModel(
        id: "001",
        title: "Black Shoes",
        isFeatured: true,
        description: "Aweseome shoes",
        brand: BrandModel(
            id: "1",
            name: "Nike",
            image: TImageStrings.google3,
            isFeatured: true,
            productsCount: 200),
        salePrice: 7000,
        sku: "AAE33",
        catagoryId: "1",
        images: [TImageStrings.pImg4, TImageStrings.pImg5],
        productAttributes: [
          ProductAttributeModel(
              name: "Color", values: ["Black", "White", "Red"]),
          ProductAttributeModel(name: "Size", values: ["38", "40"]),
        ],
        productVariations: [
          ProductVariationModel(
            id: "1",
            stock: 5,
            price: 7000,
            salePrice: 7000,
            image: TImageStrings.pImg4,
            description: "Black Variation",
            attributeValues: {"Color": "Black", "Size": "38"},
          ),
          ProductVariationModel(
            id: "2",
            stock: 5,
            price: 7000,
            salePrice: 10000,
            image: TImageStrings.pImg5,
            description: "White Variation",
            attributeValues: {"Color": "White", "Size": "38"},
          ),
          ProductVariationModel(
            id: "3",
            stock: 0,
            price: 7000,
            salePrice: 0,
            image: TImageStrings.pImg3,
            description: "Red Variation",
            attributeValues: {"Color": "Red", "Size": "40"},
          ),
        ],
        thumbNail: TImageStrings.pImg4,
        price: 8000,
        productType: "ProductType.variable",
        stock: 10),
    ProductModel(
        id: "003",
        title: "T Shirts",
        isFeatured: true,
        description: "Aweseome shirts",
        brand: BrandModel(
            id: "2",
            name: "D&G",
            image: TImageStrings.lightLogo,
            isFeatured: true,
            productsCount: 200),
        salePrice: 15000,
        sku: "AAE33",
        catagoryId: "1",
        images: [
          TImageStrings.shirt1,
          TImageStrings.shirt2,
          TImageStrings.shirt3
        ],
        productAttributes: [
          ProductAttributeModel(
              name: "Color", values: ["Blue", "Black", "Grey"]),
          ProductAttributeModel(name: "Size", values: ["38", "40"]),
        ],
        productVariations: [
          ProductVariationModel(
            id: "1",
            stock: 5,
            price: 18000,
            salePrice: 15000,
            image: TImageStrings.shirt1,
            description: "Black Variation",
            attributeValues: {"Color": "Black", "Size": "38"},
          ),
          ProductVariationModel(
            id: "2",
            stock: 5,
            price: 18000,
            salePrice: 15000,
            image: TImageStrings.shirt1,
            description: "Black Variation",
            attributeValues: {"Color": "Black", "Size": "40"},
          ),
          ProductVariationModel(
            id: "3",
            stock: 2,
            price: 16000,
            salePrice: 0,
            image: TImageStrings.shirt2,
            description: "Grey Variation",
            attributeValues: {"Color": "Grey", "Size": "38"},
          ),
          ProductVariationModel(
            id: "4",
            stock: 2,
            price: 16000,
            salePrice: 0,
            image: TImageStrings.shirt2,
            description: "Grey Variation",
            attributeValues: {"Color": "Grey", "Size": "40"},
          ),
          ProductVariationModel(
            id: "5",
            stock: 2,
            price: 16000,
            salePrice: 12000,
            image: TImageStrings.shirt3,
            description: "Blue Variation",
            attributeValues: {"Color": "Blue", "Size": "38"},
          ),
          ProductVariationModel(
            id: "6",
            stock: 0,
            price: 16000,
            salePrice: 0,
            image: TImageStrings.shirt3,
            description: "Blue Variation",
            attributeValues: {"Color": "Blue", "Size": "40"},
          ),
        ],
        thumbNail: TImageStrings.shirt1,
        price: 20000,
        productType: "ProductType.variable",
        stock: 10),
    ProductModel(
        id: "002",
        title: "White Shoes",
        isFeatured: true,
        description: "Aweseome shoes",
        brand: BrandModel(
            id: "1",
            name: "Nike",
            image: TImageStrings.google3,
            isFeatured: true,
            productsCount: 200),
        salePrice: 7000,
        sku: "AAE33",
        catagoryId: "1",
        images: [TImageStrings.pImg1, TImageStrings.pImg2, TImageStrings.pImg3],
        productAttributes: [
          ProductAttributeModel(name: "Color", values: ["Black", "White"]),
          ProductAttributeModel(name: "Size", values: ["38", "40"]),
        ],
        thumbNail: TImageStrings.pImg1,
        price: 8000,
        productType: "ProductType.single",
        stock: 10),
    ProductModel(
        id: "004",
        title: "Black Shoes",
        isFeatured: true,
        description: "Aweseome Sport shoes",
        brand: BrandModel(
            id: "1",
            name: "Nike",
            image: TImageStrings.google3,
            isFeatured: true,
            productsCount: 200),
        salePrice: 0,
        sku: "AAE33",
        catagoryId: "8",
        images: [TImageStrings.sportShoes1],
        thumbNail: TImageStrings.sportShoes1,
        price: 8000,
        productType: "ProductType.single",
        stock: 10),
    ProductModel(
        id: "005",
        title: "Track Suits",
        isFeatured: true,
        description: "Aweseome Track Suits",
        brand: BrandModel(
            id: "1",
            name: "Nike",
            image: TImageStrings.google3,
            isFeatured: true,
            productsCount: 200),
        salePrice: 0,
        sku: "AAE33",
        catagoryId: "9",
        images: [TImageStrings.trackSuits1, TImageStrings.trackSuits2],
        thumbNail: TImageStrings.trackSuits1,
        price: 11000,
        productType: "ProductType.single",
        stock: 10),
    ProductModel(
        id: "006",
        title: "Gym Equipments",
        isFeatured: true,
        description: "Gym Equipments",
        brand: BrandModel(
            id: "1",
            name: "Nike",
            image: TImageStrings.google3,
            isFeatured: true,
            productsCount: 200),
        salePrice: 0,
        sku: "AAE33",
        catagoryId: "9",
        images: [TImageStrings.sportEqu1, TImageStrings.sportEqu2],
        thumbNail: TImageStrings.sportEqu1,
        price: 100000,
        productType: "ProductType.single",
        stock: 1),
  ];

  static final List<BrandModel> brands = [
    BrandModel(
        id: "1",
        name: "Nike",
        image: TImageStrings.google3,
        isFeatured: true,
        productsCount: 250),
    BrandModel(
        id: "2",
        name: "D & G",
        image: TImageStrings.darkLogo,
        isFeatured: true,
        productsCount: 200),
  ];
}
