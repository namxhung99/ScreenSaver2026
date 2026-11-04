# Hệ Thống Thiết Kế Mỹ Thuật Cổ Truyền Việt Nam (Vietnamese Heritage Design System)
> **Bản đặc tả UI/UX & Design Tokens dành cho lập trình Frontend & Creative Dev.**  
> Tinh hoa từ tranh dân gian Đông Hồ, Hàng Trống, nghệ thuật Sơn Mài, Gốm Chu Đậu, Cung đình Huế và ngày Tết cổ truyền.

---

## 1. Triết Lý Thiết Kế (Design Philosophy)

1. **Hồn Xưa trong Dáng Nay (Heritage meets Modernity):**
   - Kết hợp cấu trúc giao diện hiện đại (Bento Grid, Swiss Style, Mondrian Neo-Plasticism) với chất liệu Á Đông truyền thống.
   - Tránh rườm rà, diêm dúa. Giữ sự trang trọng, uy nghiêm nhưng gần gũi, ấm áp.

2. **Chất Liệu & Xúc Giác (Sensory & Textures):**
   - Không dùng gradient công nghiệp rực rỡ bão hòa quá cao.
   - Sử dụng các tone màu bắt nguồn từ tự nhiên: bột điệp (vỏ sò điệp), tro lá tre, than xoan, hoa dành dành, gỉ đồng, sơn ta, gỗ mít, gốm men lam.

3. **Hình Khối & Đường Nét (Geometry & Lines):**
   - Nét viền mô phỏng nhát khắc mộc bản (woodblock printing): đậm chắc, rõ ràng, dứt khoát.
   - Tỷ lệ khung cân đối, có lớp lang (matting / passe-partout) giống tranh dân gian được bồi trên giấy dó.

---

## 2. Bảng Màu Truyền Thống (Heritage Color Palette)

### 2.1. Nhóm Màu Giấy Dó & Đất Mẹ (Base Paper & Earth)
| Mã Màu | Tên Gọi | Ứng Dụng | CSS Hex |
|---|---|---|---|
| **Giấy Dó Mộc** | Dó Nguyên Bản | Nền chính trang, thẻ lót | `#EFE6D5` / `#F4F1EA` |
| **Bột Điệp Ánh Kim** | Điệp Đông Hồ | Vệt sáng, card lót viền | `#FAF6EE` / `#FFFDF8` |
| **Mực Nho / Than Gỗ** | Mực Khắc Mộc Bản | Chữ chính, đường viền nét khắc | `#1E1916` / `#141413` |
| **Nâu Gỗ Gụ** | Gỗ Mộc | Đường kẻ phân cách phụ | `#3D352B` / `#2C2623` |

### 2.2. Nhóm Màu Lễ Hội & Hoàng Gia (Royal & Festive Accents)
| Mã Màu | Tên Gọi | Ý Nghĩa Văn Hóa | CSS Hex |
|---|---|---|---|
| **Đỏ Điều Cung Đình** | Đỏ Chu Sa / Sơn Ta | May mắn, thịnh vượng, Tết | `#D63820` / `#DC2626` |
| **Đỏ Huyết Dụ** | Sơn Mài Cổ | Chiều sâu, bóng đổ quyền quý | `#991B1B` / `#7F1D1D` |
| **Vàng Hoàng Yến / Mai** | Vàng Điệp Mai | Hoa mai, tài lộc, lạt tre | `#FBBF24` / `#E5B524` |
| **Vàng Lúa Chín** | Vàng Rơm | Tượng trưng cho ấm no, mùa màng | `#D99B26` / `#C89B3C` |
| **Xanh Lá Dong** | Bánh Chưng Tết | Sức sống, sinh sôi, đất trời | `#15803D` / `#166534` |
| **Hồng Đào Phai** | Hoa Đào Bắc Bộ | Mùa xuân, thanh khiết, tao nhã | `#F472B6` / `#FB7185` |
| **Xanh Men Lam** | Gốm Chu Đậu / Bát Tràng | Trí tuệ, tĩnh lặng, hoài cổ | `#1B3B6F` / `#102542` |

---

## 3. Hệ Thống Kiểu Chữ (Typography Hierarchy)

```css
/* Google Fonts gợi ý */
@import url('https://fonts.googleapis.com/css2?family=Fraunces:ital,opsz,wght@0,9..144,700..900;1,9..144,600..800&family=Playfair+Display:ital,wght@0,700..900;1,600..800&family=Plus+Jakarta+Sans:wght@400;500;600;700;800&family=JetBrains+Mono:wght@500;700;800&display=swap');
```

- **Tiêu đề Lớn (Hero Display / Giờ / Can Chi):**
  - Font: `Fraunces`, `Playfair Display`
  - Style: `font-serif font-black tracking-tight leading-none`
  - Cảm giác: Nét khắc gỗ, cổ điển nhưng sắc sảo.
- **Thân Bài & Nhãn Nhỏ (Body & Labels):**
  - Font: `Plus Jakarta Sans`, `Inter`
  - Style: `font-semibold` hoặc `font-extrabold text-xs uppercase tracking-wider`
  - Cảm giác: Dễ đọc, hiện đại, tương phản cao trên nền giấy dó.
- **Dữ Liệu Số & Giờ (Numerics / Monospace):**
  - Font: `JetBrains Mono`
  - Style: `font-mono font-bold tracking-tight`

---

## 4. Thành Phần Giao Diện Chuẩn (UI Components)

### 4.1. Khung Tranh Mộc Bản (Woodblock Art Frame)
Khung viền ôm sát tranh, mô phỏng cách đóng khung tranh lụa hoặc bản khắc gỗ:

```html
<!-- Bức tranh ôm sát viền mộc bản, không khoảng hở thừa -->
<div class="inline-flex items-center justify-center p-0.5 rounded border-[2.2px] border-[#2C2623] shadow-md bg-[#FAF6EE] overflow-hidden">
    <img src="path_to_art.png" alt="Tranh Dân Gian" class="w-auto h-auto max-h-[220px] object-contain rounded-xs" />
</div>
```

### 4.2. Huy Hiệu Thư Pháp / Can Chi (Calligraphy Pill Badge)
```html
<span class="inline-flex items-center gap-1.5 px-3 py-1 rounded-full border-[1.8px] border-current text-xs font-bold uppercase tracking-wider hover:bg-black/5 transition">
    <span class="w-2 h-2 rounded-full bg-[#D63820]"></span>
    <span>Ngày Nhâm Ngọ • Tiết Sương Giáng</span>
</span>
```

### 4.3. Ô Âm Lịch Hộp Đen (Iconic Lunar Black Box)
```html
<div class="bg-[#141413] text-[#F4F1EA] px-4 py-2.5 inline-flex flex-col items-start justify-center shadow-md">
    <div class="font-serif font-black text-2xl leading-none tracking-tight">26/9</div>
    <div class="font-serif italic text-xs text-[#E5B524] mt-0.5 flex items-center gap-1">
        <span>âm lịch</span>
    </div>
</div>
```

---

## 5. Kho Vector SVG Biểu Tượng Cổ Truyền (Vector Heritage Assets)

### 5.1. Lồng Đèn Đỏ Hội An (Hoi An Lantern)
```html
<svg viewBox="0 0 32 56" class="w-8 h-14">
    <!-- Dây treo -->
    <line x1="16" y1="0" x2="16" y2="8" stroke="#FBBF24" stroke-width="1.8" />
    <!-- Đầu chụp đồng vàng -->
    <rect x="10" y="8" width="12" height="3" rx="1" fill="#FBBF24" />
    <!-- Thân đèn đỏ chu sa nan vàng -->
    <ellipse cx="16" cy="24" rx="12" ry="14" fill="#DC2626" stroke="#991B1B" stroke-width="1" />
    <ellipse cx="16" cy="24" rx="6" ry="14" fill="none" stroke="#FDE047" stroke-width="1" opacity="0.85" />
    <line x1="16" y1="10" x2="16" y2="38" stroke="#FDE047" stroke-width="1.2" opacity="0.85" />
    <!-- Chóp đáy -->
    <rect x="11" y="38" width="10" height="2.5" rx="1" fill="#FBBF24" />
    <!-- Chùm tua rua lụa vàng -->
    <path d="M16 40.5 L16 53 M13.5 41.5 L12 52 M18.5 41.5 L20 52" stroke="#F59E0B" stroke-width="1.3" stroke-linecap="round" />
</svg>
```

### 5.2. Cặp Bánh Chưng Xanh & Dưa Hấu Đỏ (Banh Chung & Watermelon)
```html
<svg viewBox="0 0 52 42" class="w-12 h-10">
    <!-- Bánh chưng lá dong xanh mướt -->
    <rect x="4" y="10" width="24" height="24" rx="2" fill="#15803D" stroke="#166534" stroke-width="1.2" />
    <!-- Lạt tre vàng buộc chữ thập -->
    <line x1="16" y1="10" x2="16" y2="34" stroke="#FDE047" stroke-width="1.8" />
    <line x1="4" y1="22" x2="28" y2="22" stroke="#FDE047" stroke-width="1.8" />
    <!-- Lát dưa hấu đỏ may mắn -->
    <path d="M30 32 A 16 16 0 0 1 48 32 Z" fill="#DC2626" stroke="#15803D" stroke-width="1.8" />
    <circle cx="36" cy="27" r="0.9" fill="#141413" />
    <circle cx="42" cy="27" r="0.9" fill="#141413" />
    <circle cx="39" cy="24" r="0.9" fill="#141413" />
</svg>
```

### 5.3. Hoa Mai Vàng 5 Cánh (Golden Apricot Blossom)
```html
<svg viewBox="0 0 36 36" class="w-8 h-8">
    <circle cx="18" cy="9.5" r="5" fill="#FBBF24" />
    <circle cx="25.5" cy="15" r="5" fill="#FBBF24" />
    <circle cx="22.5" cy="24.5" r="5" fill="#FBBF24" />
    <circle cx="13.5" cy="24.5" r="5" fill="#FBBF24" />
    <circle cx="10.5" cy="15" r="5" fill="#FBBF24" />
    <!-- Nhụy đỏ cam & chấm phấn vàng -->
    <circle cx="18" cy="18" r="3.2" fill="#EA580C" />
    <circle cx="18" cy="18" r="1.5" fill="#FEF08A" />
</svg>
```

### 5.4. Dây Pháo Tép Đỏ Lắc Lư (Firecracker Cluster)
```html
<svg viewBox="0 0 24 48" class="w-6 h-12">
    <line x1="12" y1="0" x2="12" y2="40" stroke="#78350F" stroke-width="1.2" />
    <rect x="4" y="6" width="7" height="3" rx="0.5" fill="#DC2626" stroke="#991B1B" stroke-width="0.5" />
    <rect x="13" y="11" width="7" height="3" rx="0.5" fill="#DC2626" stroke="#991B1B" stroke-width="0.5" />
    <rect x="4" y="16" width="7" height="3" rx="0.5" fill="#DC2626" stroke="#991B1B" stroke-width="0.5" />
    <rect x="13" y="21" width="7" height="3" rx="0.5" fill="#DC2626" stroke="#991B1B" stroke-width="0.5" />
    <rect x="4" y="26" width="7" height="3" rx="0.5" fill="#DC2626" stroke="#991B1B" stroke-width="0.5" />
    <rect x="13" y="31" width="7" height="3" rx="0.5" fill="#DC2626" stroke="#991B1B" stroke-width="0.5" />
    <circle cx="12" cy="42" r="2" fill="#FBBF24" />
</svg>
```

---

## 6. Thư Viện Chuyển Động (Animation Presets - CSS Keyframes)

```css
/* 1. Lồng đèn đung đưa theo gió xuân */
@keyframes tetLanternSway {
    0% { transform: rotate(-7deg); }
    50% { transform: rotate(7deg); }
    100% { transform: rotate(-7deg); }
}
.anim-lantern {
    animation: tetLanternSway 3.6s ease-in-out infinite;
    transform-origin: 50% 0%;
}

/* 2. Cành mai / Cành đào nở rộ rung rinh */
@keyframes tetBlossomFloat {
    0%, 100% { transform: translateY(0px) rotate(0deg) scale(1); }
    50% { transform: translateY(-4px) rotate(12deg) scale(1.08); }
}
.anim-blossom {
    animation: tetBlossomFloat 3.2s ease-in-out infinite;
}

/* 3. Tia pháo hoa may mắn lấp lánh */
@keyframes tetSparkle {
    0%, 100% { opacity: 0.35; transform: scale(0.85); }
    50% { opacity: 1; transform: scale(1.25); filter: drop-shadow(0 0 6px #FBBF24); }
}
.anim-sparkle {
    animation: tetSparkle 1.8s ease-in-out infinite;
}

/* 4. Cánh hoa mai / đào bay phất phới */
@keyframes tetPetalDrift {
    0% { transform: translate(0, 0) rotate(0deg); opacity: 0; }
    20% { opacity: 0.9; }
    80% { opacity: 0.9; }
    100% { transform: translate(-38px, 26px) rotate(140deg); opacity: 0; }
}
.anim-petal {
    animation: tetPetalDrift 4.4s ease-in-out infinite;
}

/* 5. Bánh chưng bồng bềnh */
@keyframes tetBanhChungFloat {
    0%, 100% { transform: translateY(0px) rotate(0deg); }
    50% { transform: translateY(-3px) rotate(2.5deg); }
}
.anim-banhchung {
    animation: tetBanhChungFloat 4s ease-in-out infinite;
}

/* 6. Dây pháo lắc lư */
@keyframes tetFirecrackerSway {
    0% { transform: rotate(-5deg); }
    50% { transform: rotate(5deg); }
    100% { transform: rotate(-5deg); }
}
.anim-firecracker {
    animation: tetFirecrackerSway 2.8s ease-in-out infinite;
    transform-origin: 50% 0%;
}
```

---

## 7. Quy Tắc Ứng Dụng Thực Tiễn (Vibe Frontend Tips)

1. **Hiệu ứng Bụi Nắng / Hạt Điệp Lơ Lửng (Ambient Dust Canvas):**
   - Đặt một `canvas` mờ `opacity-40` phía sau nền với các hạt vàng nhạt bay chầm chậm. Tạo xúc giác như đang nhìn vào bề mặt giấy dó hoặc bức tranh sơn mài cổ.
2. **Âm Thanh Nền (Ambient Sounds):**
   - Tiếng mưa đêm ấm áp (`lowpass filter 680Hz`).
   - Tiếng lửa trại reo tanh tách (`lowpass filter 380Hz`).
   - Chuông xoay Tây Tạng / Chuông đồng thiền định (`sine wave 432Hz - 864Hz - 1296Hz`).
3. **Hiệu ứng Chống Lưu Ảnh Màn Hình (OLED Burn-in Pixel Shift):**
   - Với các screensaver cổ truyền chạy 24/7, luôn thiết lập dịch chuyển tọa độ `--shift-x`, `--shift-y` ngẫu nhiên từ `-2px` đến `+2px` mỗi 60 giây.
