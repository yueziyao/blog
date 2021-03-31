---
title: Bootstrap V5 色彩变量设置
date: 2021-03-29 21:38:59
tags:
    - 前端
    - Bootstrap V5
    - 色彩变量
---

从v3开始就学习bootstrap的全局变量设置，对比v3在变量设置方面，v5还是有很大变化的。

得益于sass版本的升级，bsV4 的变量设置开始就与前几个版本有较大不同，v5是进行了进一步升级。

```scss
// Color system

// scss-docs-start gray-color-variables
$white:    #fff !default;
$gray-100: #f8f9fa !default;
$gray-200: #e9ecef !default;
$gray-300: #dee2e6 !default;
$gray-400: #ced4da !default;
$gray-500: #adb5bd !default;
$gray-600: #6c757d !default;
$gray-700: #495057 !default;
$gray-800: #343a40 !default;
$gray-900: #212529 !default;
$black:    #000 !default;

// scss-docs-start color-variables
$blue:    #0d6efd !default;
$indigo:  #6610f2 !default;
$purple:  #6f42c1 !default;
$pink:    #d63384 !default;
$red:     #dc3545 !default;
$orange:  #fd7e14 !default;
$yellow:  #ffc107 !default;
$green:   #198754 !default;
$teal:    #20c997 !default;
$cyan:    #0dcaf0 !default;
```

以上就是bs v5所使用的所有颜色的基础色，主要分为灰色系和彩色系。这些颜色会作为基础色，在系统中进行使用。这样做一方面可以统一管理色彩，另一方面方便做系统色系的变更。

例如，系统的色彩设置如下：

```scss
$primary:       $blue !default;
$secondary:     $gray-600 !default;
$success:       $green !default;
$info:          $cyan !default;
$warning:       $yellow !default;
$danger:        $red !default;
$light:         $gray-100 !default;
$dark:          $gray-900 !default;
```

他们使用的基础色作为主题色的变量。

另一方面，不同的 `$blue-xxx` 也是源自于基础的`$blue`,如下：

```scss
// fusv-disable
$blue-100: tint-color($blue, 80%) !default;
$blue-200: tint-color($blue, 60%) !default;
$blue-300: tint-color($blue, 40%) !default;
$blue-400: tint-color($blue, 20%) !default;
$blue-500: $blue !default;
$blue-600: shade-color($blue, 20%) !default;
$blue-700: shade-color($blue, 40%) !default;
$blue-800: shade-color($blue, 60%) !default;
$blue-900: shade-color($blue, 80%) !default;
```

其中的变换方法已不再使用v3的变换，v3是使用SASS自带的 `darken()`和`lighten()`方法，进行基础色的变淡、变深。

而v5版本，是使用上述`tint-color()`和`shade-color()`方法。在`_function.scss`源码中,是这样定义这两个方法的：

```scss
// scss-docs-start color-functions
// Tint a color: mix a color with white
@function tint-color($color, $weight) {
  @return mix(white, $color, $weight);
}

// Shade a color: mix a color with black
@function shade-color($color, $weight) {
  @return mix(black, $color, $weight);
}
```

mix方法，参见 https://sass-lang.com/documentation/modules/color#mix  是混合色彩所用。

后续我们再分析下其它变量的设置。