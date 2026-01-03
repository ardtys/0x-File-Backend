# Animated Background Implementation Guide

## Background Animations yang Running di Frontend

### 1. **Dotted Grid Background** (Static Pattern)
**Nama:** Dotted Grid / Matrix Grid
**Deskripsi:** Background dengan pola titik-titik grid yang statis
**Lokasi di Frontend:** `app/globals.css` line 19-23

```css
.dotted-grid {
  background-image: radial-gradient(circle, rgba(139, 92, 246, 0.03) 1px, transparent 1px);
  background-size: 40px 40px;
  position: fixed;
  inset: 0;
  pointer-events: none;
}
```

**Cara Implementasi di Backend:**
```html
<!-- Tambahkan di layout utama -->
<div class="dotted-grid"></div>
```

**Karakteristik:**
- ✅ Ringan (tidak animated, hanya CSS pattern)
- ✅ Tidak mempengaruhi performa
- ✅ Pure CSS, tidak perlu JavaScript
- ✅ **SANGAT DIREKOMENDASIKAN untuk backend**

---

### 2. **Scanning Lines** (Animated)
**Nama:** Scanning Lines / Cyber Scan Lines
**Deskripsi:** Garis horizontal dan vertikal yang bergerak melintasi layar
**Lokasi di Frontend:** `app/page.tsx` line 95-104

```jsx
{/* Animated Background Lines */}
<div className="fixed inset-0 pointer-events-none overflow-hidden">
  {/* Horizontal Lines */}
  <div className="absolute w-full h-px bg-gradient-to-r from-transparent via-purple-primary/8 to-transparent top-[20%] animate-scan-horizontal" />
  <div className="absolute w-full h-px bg-gradient-to-r from-transparent via-purple-primary/5 to-transparent top-[60%] animate-scan-horizontal-slow" />

  {/* Vertical Lines */}
  <div className="absolute h-full w-px bg-gradient-to-b from-transparent via-purple-primary/8 to-transparent left-[30%] animate-scan-vertical" />
  <div className="absolute h-full w-px bg-gradient-to-b from-transparent via-purple-primary/5 to-transparent left-[70%] animate-scan-vertical-slow" />
</div>
```

**CSS Animation:**
```css
/* Horizontal scanning */
@keyframes scanHorizontal {
  0% {
    transform: translateY(-100vh);
    opacity: 0;
  }
  10% {
    opacity: 1;
  }
  90% {
    opacity: 1;
  }
  100% {
    transform: translateY(100vh);
    opacity: 0;
  }
}

.animate-scan-horizontal {
  animation: scanHorizontal 8s linear infinite;
}

.animate-scan-horizontal-slow {
  animation: scanHorizontal 12s linear infinite;
}

/* Vertical scanning */
@keyframes scanVertical {
  0% {
    transform: translateX(-100vw);
    opacity: 0;
  }
  10% {
    opacity: 1;
  }
  90% {
    opacity: 1;
  }
  100% {
    transform: translateX(100vw);
    opacity: 0;
  }
}

.animate-scan-vertical {
  animation: scanVertical 10s linear infinite;
}

.animate-scan-vertical-slow {
  animation: scanVertical 15s linear infinite;
}
```

**Cara Implementasi di Backend:**
```html
<!-- HTML Structure -->
<div class="scanning-lines-container">
  <div class="scan-line scan-line-h-1"></div>
  <div class="scan-line scan-line-h-2"></div>
  <div class="scan-line scan-line-v-1"></div>
  <div class="scan-line scan-line-v-2"></div>
</div>
```

```css
/* CSS Styles */
.scanning-lines-container {
  position: fixed;
  inset: 0;
  pointer-events: none;
  overflow: hidden;
  z-index: 1;
}

.scan-line {
  position: absolute;
}

/* Horizontal Lines */
.scan-line-h-1 {
  width: 100%;
  height: 1px;
  background: linear-gradient(90deg, transparent, rgba(139, 92, 246, 0.08), transparent);
  top: 20%;
  animation: scanHorizontal 8s linear infinite;
}

.scan-line-h-2 {
  width: 100%;
  height: 1px;
  background: linear-gradient(90deg, transparent, rgba(139, 92, 246, 0.05), transparent);
  top: 60%;
  animation: scanHorizontal 12s linear infinite;
}

/* Vertical Lines */
.scan-line-v-1 {
  height: 100%;
  width: 1px;
  background: linear-gradient(180deg, transparent, rgba(139, 92, 246, 0.08), transparent);
  left: 30%;
  animation: scanVertical 10s linear infinite;
}

.scan-line-v-2 {
  height: 100%;
  width: 1px;
  background: linear-gradient(180deg, transparent, rgba(139, 92, 246, 0.05), transparent);
  left: 70%;
  animation: scanVertical 15s linear infinite;
}
```

**Karakteristik:**
- ⚠️ Menggunakan CSS animation (GPU-accelerated)
- ⚠️ Performa baik karena hanya transform
- ✅ **DIREKOMENDASIKAN untuk backend** (performa bagus)

---

### 3. **Floating Particles** (Animated)
**Nama:** Floating Particles / Cyber Particles
**Deskripsi:** Partikel-partikel kecil yang mengambang naik
**Lokasi di Frontend:** `app/page.tsx` line 106-120

```jsx
{/* Floating Particles */}
<div className="fixed inset-0 pointer-events-none overflow-hidden">
  {[...Array(8)].map((_, i) => (
    <div
      key={i}
      className="absolute w-1 h-1 bg-purple-primary/12 rounded-full animate-float-particle"
      style={{
        left: `${15 + i * 12}%`,
        top: `${20 + (i % 3) * 25}%`,
        animationDelay: `${i * 1.5}s`,
        animationDuration: `${8 + (i % 3) * 2}s`,
      }}
    />
  ))}
</div>
```

**CSS Animation:**
```css
@keyframes floatParticleSmooth {
  0%, 100% {
    transform: translate(0, 0);
    opacity: 0.3;
  }
  25% {
    transform: translate(20px, -30px);
    opacity: 0.6;
  }
  50% {
    transform: translate(-15px, -60px);
    opacity: 0.8;
  }
  75% {
    transform: translate(25px, -90px);
    opacity: 0.5;
  }
}

.animate-float-particle {
  animation: floatParticleSmooth 10s ease-in-out infinite;
}
```

**Cara Implementasi di Backend:**

**Opsi 1: Pure CSS (Tanpa JavaScript)**
```html
<!-- HTML Structure -->
<div class="particles-container">
  <div class="particle particle-1"></div>
  <div class="particle particle-2"></div>
  <div class="particle particle-3"></div>
  <div class="particle particle-4"></div>
  <div class="particle particle-5"></div>
  <div class="particle particle-6"></div>
  <div class="particle particle-7"></div>
  <div class="particle particle-8"></div>
</div>
```

```css
/* CSS Styles */
.particles-container {
  position: fixed;
  inset: 0;
  pointer-events: none;
  overflow: hidden;
  z-index: 1;
}

.particle {
  position: absolute;
  width: 4px;
  height: 4px;
  background-color: rgba(139, 92, 246, 0.12);
  border-radius: 50%;
  animation: floatParticleSmooth 10s ease-in-out infinite;
}

/* Individual particle positions and delays */
.particle-1 { left: 15%; top: 20%; animation-delay: 0s; animation-duration: 8s; }
.particle-2 { left: 27%; top: 45%; animation-delay: 1.5s; animation-duration: 10s; }
.particle-3 { left: 39%; top: 70%; animation-delay: 3s; animation-duration: 12s; }
.particle-4 { left: 51%; top: 20%; animation-delay: 4.5s; animation-duration: 8s; }
.particle-5 { left: 63%; top: 45%; animation-delay: 6s; animation-duration: 10s; }
.particle-6 { left: 75%; top: 70%; animation-delay: 7.5s; animation-duration: 12s; }
.particle-7 { left: 87%; top: 20%; animation-delay: 9s; animation-duration: 8s; }
.particle-8 { left: 99%; top: 45%; animation-delay: 10.5s; animation-duration: 10s; }
```

**Opsi 2: Dengan JavaScript (Lebih Fleksibel)**
```html
<div id="particles-container"></div>
```

```javascript
// Generate particles dynamically
const particlesContainer = document.getElementById('particles-container');
particlesContainer.style.cssText = 'position: fixed; inset: 0; pointer-events: none; overflow: hidden; z-index: 1;';

for (let i = 0; i < 8; i++) {
  const particle = document.createElement('div');
  particle.className = 'particle';
  particle.style.cssText = `
    position: absolute;
    width: 4px;
    height: 4px;
    background-color: rgba(139, 92, 246, 0.12);
    border-radius: 50%;
    left: ${15 + i * 12}%;
    top: ${20 + (i % 3) * 25}%;
    animation: floatParticleSmooth ${8 + (i % 3) * 2}s ease-in-out infinite;
    animation-delay: ${i * 1.5}s;
  `;
  particlesContainer.appendChild(particle);
}
```

**Karakteristik:**
- ⚠️ Menggunakan CSS animation
- ⚠️ 8 elemen DOM untuk particles
- ✅ **OPSIONAL untuk backend** (bisa di-skip jika ingin lebih ringan)

---

### 4. **Glowing Orbs** (Animated)
**Nama:** Ambient Glowing Orbs / Glow Blobs
**Deskripsi:** Bola-bola cahaya besar yang bergerak perlahan dengan blur effect
**Lokasi di Frontend:** `app/page.tsx` line 122-127

```jsx
{/* Glowing Orbs */}
<div className="fixed inset-0 pointer-events-none overflow-hidden opacity-15">
  <div className="absolute w-96 h-96 bg-purple-primary/8 rounded-full blur-3xl top-[10%] left-[10%] animate-orb-1" />
  <div className="absolute w-80 h-80 bg-purple-light/8 rounded-full blur-3xl bottom-[20%] right-[15%] animate-orb-2" />
  <div className="absolute w-72 h-72 bg-purple-dark/8 rounded-full blur-3xl top-[60%] left-[60%] animate-orb-3" />
</div>
```

**CSS Animation:**
```css
@keyframes floatOrb1 {
  0%, 100% {
    transform: translate(0, 0) scale(1);
  }
  33% {
    transform: translate(50px, -80px) scale(1.1);
  }
  66% {
    transform: translate(-30px, 60px) scale(0.9);
  }
}

@keyframes floatOrb2 {
  0%, 100% {
    transform: translate(0, 0) scale(1);
  }
  33% {
    transform: translate(-60px, 70px) scale(1.15);
  }
  66% {
    transform: translate(40px, -50px) scale(0.95);
  }
}

@keyframes floatOrb3 {
  0%, 100% {
    transform: translate(0, 0) scale(1);
  }
  33% {
    transform: translate(70px, 40px) scale(0.9);
  }
  66% {
    transform: translate(-50px, -70px) scale(1.2);
  }
}

.animate-orb-1 {
  animation: floatOrb1 20s ease-in-out infinite;
}

.animate-orb-2 {
  animation: floatOrb2 25s ease-in-out infinite;
}

.animate-orb-3 {
  animation: floatOrb3 30s ease-in-out infinite;
}
```

**Cara Implementasi di Backend:**
```html
<!-- HTML Structure -->
<div class="glowing-orbs-container">
  <div class="glow-orb glow-orb-1"></div>
  <div class="glow-orb glow-orb-2"></div>
  <div class="glow-orb glow-orb-3"></div>
</div>
```

```css
/* CSS Styles */
.glowing-orbs-container {
  position: fixed;
  inset: 0;
  pointer-events: none;
  overflow: hidden;
  opacity: 0.15;
  z-index: 1;
}

.glow-orb {
  position: absolute;
  border-radius: 50%;
  filter: blur(60px);
}

.glow-orb-1 {
  width: 24rem;
  height: 24rem;
  background-color: rgba(139, 92, 246, 0.08);
  top: 10%;
  left: 10%;
  animation: floatOrb1 20s ease-in-out infinite;
}

.glow-orb-2 {
  width: 20rem;
  height: 20rem;
  background-color: rgba(167, 139, 250, 0.08);
  bottom: 20%;
  right: 15%;
  animation: floatOrb2 25s ease-in-out infinite;
}

.glow-orb-3 {
  width: 18rem;
  height: 18rem;
  background-color: rgba(124, 58, 237, 0.08);
  top: 60%;
  left: 60%;
  animation: floatOrb3 30s ease-in-out infinite;
}
```

**Karakteristik:**
- ⚠️ Menggunakan `filter: blur()` yang bisa mempengaruhi performa
- ⚠️ 3 elemen besar dengan blur
- ✅ **OPSIONAL untuk backend** (efek ambient yang subtle)

---

### 5. **Binary Rain Effect** (Animated)
**Nama:** Binary Rain / Matrix Code Rain
**Deskripsi:** Angka biner (0 dan 1) yang jatuh seperti Matrix
**Lokasi di Frontend:** `app/page.tsx` line 129-150

```jsx
{/* Binary Rain Effect */}
{mounted && binaryColumns.length > 0 && (
  <div className="fixed inset-0 pointer-events-none overflow-hidden opacity-8">
    {binaryColumns.map((column, i) => (
      <div
        key={i}
        className="absolute font-mono text-xs text-purple-primary/30 whitespace-nowrap animate-binary-rain"
        style={{
          left: `${10 + i * 15}%`,
          animationDelay: `${i * 2}s`,
          animationDuration: `${15 + i * 2}s`,
        }}
      >
        {column.map((bit, j) => (
          <div key={j} className="mb-2">
            {bit}
          </div>
        ))}
      </div>
    ))}
  </div>
)}
```

**CSS Animation:**
```css
@keyframes binaryRain {
  0% {
    transform: translateY(-100%);
    opacity: 0;
  }
  10% {
    opacity: 0.4;
  }
  90% {
    opacity: 0.4;
  }
  100% {
    transform: translateY(100vh);
    opacity: 0;
  }
}

.animate-binary-rain {
  animation: binaryRain 20s linear infinite;
}
```

**Cara Implementasi di Backend:**

**Opsi 1: Pure CSS (Static Binary)**
```html
<!-- HTML Structure -->
<div class="binary-rain-container">
  <div class="binary-column binary-col-1">
    <div>1</div><div>0</div><div>1</div><div>1</div><div>0</div>
    <div>1</div><div>0</div><div>1</div><div>0</div><div>1</div>
    <div>0</div><div>1</div><div>1</div><div>0</div><div>0</div>
    <div>1</div><div>0</div><div>1</div><div>1</div><div>0</div>
  </div>
  <!-- Repeat for more columns -->
</div>
```

```css
/* CSS Styles */
.binary-rain-container {
  position: fixed;
  inset: 0;
  pointer-events: none;
  overflow: hidden;
  opacity: 0.08;
  z-index: 1;
}

.binary-column {
  position: absolute;
  font-family: 'JetBrains Mono', monospace;
  font-size: 0.75rem;
  color: rgba(139, 92, 246, 0.3);
  white-space: nowrap;
  animation: binaryRain 20s linear infinite;
}

.binary-column div {
  margin-bottom: 0.5rem;
}

.binary-col-1 { left: 10%; animation-delay: 0s; animation-duration: 15s; }
.binary-col-2 { left: 25%; animation-delay: 2s; animation-duration: 17s; }
.binary-col-3 { left: 40%; animation-delay: 4s; animation-duration: 19s; }
.binary-col-4 { left: 55%; animation-delay: 6s; animation-duration: 21s; }
.binary-col-5 { left: 70%; animation-delay: 8s; animation-duration: 23s; }
.binary-col-6 { left: 85%; animation-delay: 10s; animation-duration: 25s; }
```

**Opsi 2: Dengan JavaScript (Dynamic Binary)**
```javascript
// Generate binary rain dynamically
const binaryContainer = document.createElement('div');
binaryContainer.style.cssText = 'position: fixed; inset: 0; pointer-events: none; overflow: hidden; opacity: 0.08; z-index: 1;';
document.body.appendChild(binaryContainer);

// Create 6 columns
for (let i = 0; i < 6; i++) {
  const column = document.createElement('div');
  column.style.cssText = `
    position: absolute;
    font-family: 'JetBrains Mono', monospace;
    font-size: 0.75rem;
    color: rgba(139, 92, 246, 0.3);
    white-space: nowrap;
    left: ${10 + i * 15}%;
    animation: binaryRain ${15 + i * 2}s linear infinite;
    animation-delay: ${i * 2}s;
  `;

  // Generate 20 random binary digits
  for (let j = 0; j < 20; j++) {
    const bit = document.createElement('div');
    bit.textContent = Math.random() > 0.5 ? '1' : '0';
    bit.style.marginBottom = '0.5rem';
    column.appendChild(bit);
  }

  binaryContainer.appendChild(column);
}
```

**Karakteristik:**
- ⚠️ Banyak elemen DOM (6 columns × 20 bits = 120 elements)
- ⚠️ Bisa mempengaruhi performa jika terlalu banyak
- ❌ **TIDAK DIREKOMENDASIKAN untuk backend** (terlalu berat, lebih cocok untuk landing page)

---

## Rekomendasi Implementasi untuk Backend

### ✅ WAJIB IMPLEMENTASI (Ringan & Efektif)
1. **Dotted Grid Background** - Pola statis, sangat ringan
2. **Scanning Lines** - Animasi smooth dengan performa bagus

### ⚠️ OPSIONAL (Tergantung Kebutuhan)
3. **Glowing Orbs** - Efek ambient yang subtle, opsional jika ingin lebih premium
4. **Floating Particles** - Bisa di-skip jika ingin lebih minimalis

### ❌ TIDAK DISARANKAN (Terlalu Berat)
5. **Binary Rain** - Terlalu banyak elemen, lebih cocok untuk landing page marketing

---

## Template Lengkap untuk Backend

### Implementasi Minimal (Ringan & Optimal)

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Øxfile Backend</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
  <style>
    /* Base Styles */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      background-color: #000000;
      color: #ffffff;
      font-family: 'JetBrains Mono', monospace;
      min-height: 100vh;
      overflow-x: hidden;
    }

    /* 1. Dotted Grid Background */
    .dotted-grid {
      background-image: radial-gradient(circle, rgba(139, 92, 246, 0.03) 1px, transparent 1px);
      background-size: 40px 40px;
      position: fixed;
      inset: 0;
      pointer-events: none;
      z-index: 0;
    }

    /* 2. Scanning Lines Container */
    .scanning-lines {
      position: fixed;
      inset: 0;
      pointer-events: none;
      overflow: hidden;
      z-index: 1;
    }

    .scan-line {
      position: absolute;
    }

    .scan-line-h-1 {
      width: 100%;
      height: 1px;
      background: linear-gradient(90deg, transparent, rgba(139, 92, 246, 0.08), transparent);
      top: 20%;
      animation: scanHorizontal 8s linear infinite;
    }

    .scan-line-h-2 {
      width: 100%;
      height: 1px;
      background: linear-gradient(90deg, transparent, rgba(139, 92, 246, 0.05), transparent);
      top: 60%;
      animation: scanHorizontal 12s linear infinite;
    }

    .scan-line-v-1 {
      height: 100%;
      width: 1px;
      background: linear-gradient(180deg, transparent, rgba(139, 92, 246, 0.08), transparent);
      left: 30%;
      animation: scanVertical 10s linear infinite;
    }

    .scan-line-v-2 {
      height: 100%;
      width: 1px;
      background: linear-gradient(180deg, transparent, rgba(139, 92, 246, 0.05), transparent);
      left: 70%;
      animation: scanVertical 15s linear infinite;
    }

    /* Animations */
    @keyframes scanHorizontal {
      0% {
        transform: translateY(-100vh);
        opacity: 0;
      }
      10% {
        opacity: 1;
      }
      90% {
        opacity: 1;
      }
      100% {
        transform: translateY(100vh);
        opacity: 0;
      }
    }

    @keyframes scanVertical {
      0% {
        transform: translateX(-100vw);
        opacity: 0;
      }
      10% {
        opacity: 1;
      }
      90% {
        opacity: 1;
      }
      100% {
        transform: translateX(100vw);
        opacity: 0;
      }
    }

    /* Main Content */
    .main-content {
      position: relative;
      z-index: 10;
      padding: 2rem;
    }
  </style>
</head>
<body>
  <!-- Background Layers -->
  <div class="dotted-grid"></div>
  <div class="scanning-lines">
    <div class="scan-line scan-line-h-1"></div>
    <div class="scan-line scan-line-h-2"></div>
    <div class="scan-line scan-line-v-1"></div>
    <div class="scan-line scan-line-v-2"></div>
  </div>

  <!-- Your Main Content Here -->
  <div class="main-content">
    <h1>Your Backend Content</h1>
  </div>
</body>
</html>
```

### Implementasi dengan Glowing Orbs (Premium Look)

Tambahkan setelah `<div class="scanning-lines">...</div>`:

```html
<!-- Glowing Orbs (Optional) -->
<div class="glowing-orbs">
  <div class="glow-orb glow-orb-1"></div>
  <div class="glow-orb glow-orb-2"></div>
  <div class="glow-orb glow-orb-3"></div>
</div>
```

Tambahkan di CSS:

```css
/* 3. Glowing Orbs (Optional) */
.glowing-orbs {
  position: fixed;
  inset: 0;
  pointer-events: none;
  overflow: hidden;
  opacity: 0.15;
  z-index: 1;
}

.glow-orb {
  position: absolute;
  border-radius: 50%;
  filter: blur(60px);
}

.glow-orb-1 {
  width: 24rem;
  height: 24rem;
  background-color: rgba(139, 92, 246, 0.08);
  top: 10%;
  left: 10%;
  animation: floatOrb1 20s ease-in-out infinite;
}

.glow-orb-2 {
  width: 20rem;
  height: 20rem;
  background-color: rgba(167, 139, 250, 0.08);
  bottom: 20%;
  right: 15%;
  animation: floatOrb2 25s ease-in-out infinite;
}

.glow-orb-3 {
  width: 18rem;
  height: 18rem;
  background-color: rgba(124, 58, 237, 0.08);
  top: 60%;
  left: 60%;
  animation: floatOrb3 30s ease-in-out infinite;
}

@keyframes floatOrb1 {
  0%, 100% {
    transform: translate(0, 0) scale(1);
  }
  33% {
    transform: translate(50px, -80px) scale(1.1);
  }
  66% {
    transform: translate(-30px, 60px) scale(0.9);
  }
}

@keyframes floatOrb2 {
  0%, 100% {
    transform: translate(0, 0) scale(1);
  }
  33% {
    transform: translate(-60px, 70px) scale(1.15);
  }
  66% {
    transform: translate(40px, -50px) scale(0.95);
  }
}

@keyframes floatOrb3 {
  0%, 100% {
    transform: translate(0, 0) scale(1);
  }
  33% {
    transform: translate(70px, 40px) scale(0.9);
  }
  66% {
    transform: translate(-50px, -70px) scale(1.2);
  }
}
```

---

## Perbandingan Performa

| Background Effect | DOM Elements | Animation | Performa | Rekomendasi Backend |
|-------------------|--------------|-----------|----------|---------------------|
| **Dotted Grid** | 1 (div) | None (static) | ⭐⭐⭐⭐⭐ Excellent | ✅ Wajib |
| **Scanning Lines** | 4 (div) | CSS transform | ⭐⭐⭐⭐⭐ Excellent | ✅ Wajib |
| **Glowing Orbs** | 3 (div) | CSS transform + blur | ⭐⭐⭐⭐ Good | ⚠️ Opsional |
| **Floating Particles** | 8 (div) | CSS transform | ⭐⭐⭐⭐ Good | ⚠️ Opsional |
| **Binary Rain** | 120 (div) | CSS transform | ⭐⭐ Fair | ❌ Skip |

---

## Kesimpulan

**Untuk Backend, Implementasikan:**
1. ✅ **Dotted Grid** - Wajib (ringan, no animation)
2. ✅ **Scanning Lines** - Wajib (smooth, GPU-accelerated)
3. ⚠️ **Glowing Orbs** - Opsional (jika ingin premium look)
4. ❌ **Binary Rain** - Skip (terlalu berat untuk backend)
5. ❌ **Floating Particles** - Skip (opsional, bisa di-skip)

**Total Performance Impact:**
- Minimal: 5 DOM elements (Grid + Lines)
- Dengan Orbs: 8 DOM elements
- Performa: Excellent (GPU-accelerated animations)

---

**File Created:** 2026-01-03
**Design System:** Øxfile Animated Backgrounds
