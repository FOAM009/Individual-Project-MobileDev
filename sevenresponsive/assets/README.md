# Assets Folder Structure

This folder contains all the images and assets used in the 7-Eleven Style App.

## 📁 Folder Organization

```
assets/
└── images/
    ├── banners/           # Header and campaign banners
    ├── products/          # Product images
    ├── services/          # Service icons (optional)
    ├── promotions/        # Promotion banner images
    └── logos/             # App logo and branding
```

## 🖼️ Required Images

### 1. Banners
- `banner_welcome.png` - Main welcome banner (recommended: 1200x600px)
- `campaign_summer.jpg` - Summer campaign banner (recommended: 1200x400px)
- `campaign_health.jpg` - Health & wellness campaign (recommended: 1200x400px)

### 2. Products (Recommended: 400x400px)
- `product_slurpee.png` - Mango Slurpee
- `product_coffee.png` - Premium Coffee
- `product_sandwich.png` - Sandwich Set
- `product_pie.png` - Chicken Pie
- `product_salad.png` - Fresh Salad
- `product_onigiri.png` - Onigiri Set

### 3. Promotions (Recommended: 600x300px)
- `promo_happyhour.jpg` - Happy Hour promotion
- `promo_member.jpg` - Member Special promotion
- `promo_weekend.jpg` - Weekend Sale promotion

### 4. Logo (Recommended: 200x200px)
- `logo.png` - App logo (will be used in sidebar)

## 📝 How to Update the Code

Once you add your images, update the image URLs in the model files:

### Example: Product Images
**File:** `lib/models/product.dart`

```dart
Product(
  id: '1',
  title: 'Slurpee Mango',
  imageUrl: 'assets/images/product_slurpee.png',  // Change from URL to asset path
  // ... other properties
)
```

### Example: Banner Images
**File:** `lib/screens/home_screen.dart`

```dart
HeaderBanner(
  imageUrl: 'assets/images/banner_welcome.png',  // Use asset path
  // ... other properties
)
```

## 🎨 Image Guidelines

- **Format**: PNG or JPG (PNG for graphics, JPG for photos)
- **Size**: Keep images under 500KB each for better performance
- **Resolution**:
  - Mobile: 2x resolution (@2x)
  - Tablet/Desktop: 3x resolution (@3x)
- **Compression**: Use tools like TinyPNG to optimize file size

## 🚀 After Adding Images

After placing your images in the `assets/images/` folder:

1. Run `flutter pub get` to ensure assets are registered
2. Run `flutter clean` to clear cache
3. Run `flutter run` to see the updated images

## 📋 Naming Convention

Use lowercase with underscores:
- ✅ `product_coffee.png`
- ✅ `banner_welcome.png`
- ❌ `ProductCoffee.png`
- ❌ `banner welcome.png`

## 🎯 Current State

The app currently uses placeholder images from placeholder.com. Once you add real images, the app will look much better!

### Files to Update:
1. `lib/models/product.dart` - Product image URLs
2. `lib/models/promotion.dart` - Promotion image URLs
3. `lib/models/campaign.dart` - Campaign image URLs
4. `lib/screens/home_screen.dart` - Header banner and logo

---

**📝 Note:** Make sure to restart your app after adding new assets for them to appear properly.
