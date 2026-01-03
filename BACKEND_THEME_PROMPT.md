# Backend Theme Implementation Prompt

## Design System Overview

Implementasikan tema dark minimalist dengan dominasi warna hitam dan accent warna ungu untuk aplikasi backend Øxfile. Tema ini menggunakan prinsip zero-knowledge encryption dengan visual yang bersih, modern, dan fokus pada keamanan.

---

## Color Palette

### Primary Colors
```css
/* Background Colors */
--bg-primary: #000000;           /* Pure black - Main background */
--bg-secondary: #0a0a0a;         /* Almost black - Card backgrounds */
--bg-tertiary: #141414;          /* Dark gray - Elevated surfaces */

/* Purple Accent Colors */
--purple-primary: #8b5cf6;       /* Primary purple - Main accent */
--purple-light: #a78bfa;         /* Light purple - Hover states */
--purple-dark: #7c3aed;          /* Dark purple - Active states */
--purple-glow: rgba(139, 92, 246, 0.3); /* Purple glow effect */

/* Text Colors */
--text-primary: #ffffff;         /* White - Primary text */
--text-secondary: #a1a1aa;       /* Gray - Secondary text */
--text-tertiary: #71717a;        /* Darker gray - Tertiary text */

/* Border Colors */
--border-primary: #8b5cf6;       /* Purple border */
--border-secondary: rgba(139, 92, 246, 0.3); /* Subtle purple border */
--border-tertiary: rgba(139, 92, 246, 0.1);  /* Very subtle border */

/* Status Colors */
--success: #22c55e;              /* Green - Success states */
--error: #ef4444;                /* Red - Error states */
--warning: #f59e0b;              /* Orange - Warning states */
--info: #3b82f6;                 /* Blue - Info states */
```

---

## Typography

### Font Family
```css
/* Primary Font - Monospace for tech/security feel */
font-family: 'JetBrains Mono', 'Fira Code', 'Monaco', 'Consolas', monospace;

/* Import Font */
@import url('https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@300;400;500;600;700;800&display=swap');
```

### Font Sizes
```css
/* Headings */
--text-xs: 0.75rem;      /* 12px */
--text-sm: 0.875rem;     /* 14px */
--text-base: 1rem;       /* 16px */
--text-lg: 1.125rem;     /* 18px */
--text-xl: 1.25rem;      /* 20px */
--text-2xl: 1.5rem;      /* 24px */
--text-3xl: 1.875rem;    /* 30px */
--text-4xl: 2.25rem;     /* 36px */
--text-5xl: 3rem;        /* 48px */
```

### Font Weights
```css
--font-light: 300;
--font-regular: 400;
--font-medium: 500;
--font-semibold: 600;
--font-bold: 700;
--font-extrabold: 800;
```

---

## Component Styling Guidelines

### 1. Buttons

#### Primary Button
```css
.btn-primary {
  background-color: #8b5cf6;
  color: #ffffff;
  border: 1px solid #8b5cf6;
  padding: 0.75rem 2rem;
  font-family: 'JetBrains Mono', monospace;
  font-weight: 500;
  transition: all 0.3s ease;
  cursor: pointer;
}

.btn-primary:hover {
  background-color: #7c3aed;
  box-shadow: 0 0 20px rgba(139, 92, 246, 0.4);
}

.btn-primary:active {
  transform: scale(0.98);
}
```

#### Secondary Button (Glass Effect)
```css
.btn-secondary {
  background-color: rgba(139, 92, 246, 0.1);
  color: #a78bfa;
  border: 1px solid rgba(139, 92, 246, 0.3);
  padding: 0.75rem 2rem;
  font-family: 'JetBrains Mono', monospace;
  font-weight: 500;
  backdrop-filter: blur(10px);
  transition: all 0.3s ease;
  cursor: pointer;
}

.btn-secondary:hover {
  border-color: #8b5cf6;
  background-color: rgba(139, 92, 246, 0.2);
}
```

#### Danger Button
```css
.btn-danger {
  background-color: transparent;
  color: #ef4444;
  border: 1px solid rgba(239, 68, 68, 0.3);
  padding: 0.75rem 2rem;
  font-family: 'JetBrains Mono', monospace;
  transition: all 0.3s ease;
}

.btn-danger:hover {
  background-color: rgba(239, 68, 68, 0.1);
  border-color: #ef4444;
}
```

---

### 2. Cards

#### Standard Card
```css
.card {
  background-color: #0a0a0a;
  border: 1px solid rgba(139, 92, 246, 0.3);
  padding: 1.5rem;
  transition: all 0.3s ease;
}

.card:hover {
  border-color: rgba(139, 92, 246, 0.5);
  box-shadow: 0 4px 20px rgba(139, 92, 246, 0.1);
}
```

#### Glass Card
```css
.glass-card {
  background-color: rgba(139, 92, 246, 0.05);
  border: 1px solid rgba(139, 92, 246, 0.2);
  backdrop-filter: blur(10px);
  padding: 1.5rem;
}
```

---

### 3. Input Fields

#### Text Input
```css
.input-field {
  background-color: #000000;
  border: 1px solid rgba(139, 92, 246, 0.3);
  color: #ffffff;
  padding: 0.75rem 1rem;
  font-family: 'JetBrains Mono', monospace;
  font-size: 0.875rem;
  transition: all 0.3s ease;
}

.input-field:focus {
  outline: none;
  border-color: #8b5cf6;
  box-shadow: 0 0 0 3px rgba(139, 92, 246, 0.1);
}

.input-field::placeholder {
  color: #71717a;
}
```

#### File Upload Area
```css
.upload-area {
  background-color: transparent;
  border: 2px dashed rgba(139, 92, 246, 0.3);
  padding: 3rem;
  text-align: center;
  transition: all 0.3s ease;
  cursor: pointer;
}

.upload-area:hover {
  border-color: #8b5cf6;
  background-color: rgba(139, 92, 246, 0.05);
}

.upload-area.drag-active {
  border-color: #8b5cf6;
  background-color: rgba(139, 92, 246, 0.1);
}
```

---

### 4. Tables

```css
.table {
  width: 100%;
  border-collapse: collapse;
  font-family: 'JetBrains Mono', monospace;
}

.table thead {
  border-bottom: 1px solid rgba(139, 92, 246, 0.3);
}

.table th {
  color: #a78bfa;
  font-weight: 600;
  font-size: 0.75rem;
  text-transform: uppercase;
  letter-spacing: 0.05em;
  padding: 1rem;
  text-align: left;
}

.table td {
  color: #ffffff;
  padding: 1rem;
  border-bottom: 1px solid rgba(139, 92, 246, 0.1);
}

.table tr:hover {
  background-color: rgba(139, 92, 246, 0.05);
}
```

---

### 5. Navigation Bar

```css
.navbar {
  background-color: #000000;
  border-bottom: 1px solid rgba(139, 92, 246, 0.3);
  padding: 1rem 0;
}

.nav-link {
  color: #a1a1aa;
  font-family: 'JetBrains Mono', monospace;
  font-size: 0.875rem;
  text-decoration: none;
  padding: 0.5rem 1rem;
  transition: all 0.3s ease;
}

.nav-link:hover {
  color: #a78bfa;
}

.nav-link.active {
  color: #ffffff;
  border-bottom: 2px solid #8b5cf6;
}
```

---

### 6. Modals / Dialogs

```css
.modal-overlay {
  background-color: rgba(0, 0, 0, 0.8);
  backdrop-filter: blur(5px);
  position: fixed;
  inset: 0;
  z-index: 50;
}

.modal-content {
  background-color: #0a0a0a;
  border: 1px solid rgba(139, 92, 246, 0.3);
  padding: 2rem;
  max-width: 600px;
  margin: 2rem auto;
}

.modal-header {
  border-bottom: 1px solid rgba(139, 92, 246, 0.2);
  padding-bottom: 1rem;
  margin-bottom: 1.5rem;
}

.modal-title {
  color: #ffffff;
  font-family: 'JetBrains Mono', monospace;
  font-size: 1.5rem;
  font-weight: 700;
}
```

---

### 7. Progress Bars

```css
.progress-container {
  width: 100%;
  height: 0.5rem;
  background-color: rgba(139, 92, 246, 0.1);
  overflow: hidden;
}

.progress-bar {
  height: 100%;
  background-color: #8b5cf6;
  transition: width 0.3s ease;
  box-shadow: 0 0 10px rgba(139, 92, 246, 0.5);
}
```

---

### 8. Badges / Tags

```css
.badge {
  display: inline-block;
  padding: 0.25rem 0.75rem;
  font-family: 'JetBrains Mono', monospace;
  font-size: 0.75rem;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.05em;
}

.badge-primary {
  background-color: rgba(139, 92, 246, 0.1);
  color: #a78bfa;
  border: 1px solid rgba(139, 92, 246, 0.3);
}

.badge-success {
  background-color: rgba(34, 197, 94, 0.1);
  color: #22c55e;
  border: 1px solid rgba(34, 197, 94, 0.3);
}

.badge-error {
  background-color: rgba(239, 68, 68, 0.1);
  color: #ef4444;
  border: 1px solid rgba(239, 68, 68, 0.3);
}
```

---

### 9. Alerts / Notifications

```css
.alert {
  padding: 1rem;
  border-left: 3px solid;
  font-family: 'JetBrains Mono', monospace;
  font-size: 0.875rem;
}

.alert-success {
  background-color: rgba(34, 197, 94, 0.1);
  border-color: #22c55e;
  color: #22c55e;
}

.alert-error {
  background-color: rgba(239, 68, 68, 0.1);
  border-color: #ef4444;
  color: #ef4444;
}

.alert-warning {
  background-color: rgba(245, 158, 11, 0.1);
  border-color: #f59e0b;
  color: #f59e0b;
}

.alert-info {
  background-color: rgba(139, 92, 246, 0.1);
  border-color: #8b5cf6;
  color: #a78bfa;
}
```

---

### 10. Code Blocks

```css
.code-block {
  background-color: #000000;
  border: 1px solid rgba(139, 92, 246, 0.3);
  padding: 1rem;
  overflow-x: auto;
  font-family: 'JetBrains Mono', monospace;
  font-size: 0.875rem;
  line-height: 1.6;
}

.code-header {
  background-color: #000000;
  border-bottom: 1px solid rgba(139, 92, 246, 0.3);
  padding: 0.5rem 1rem;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.code-title {
  color: #a78bfa;
  font-size: 0.75rem;
  font-family: 'JetBrains Mono', monospace;
}

.code-content {
  color: #a1a1aa;
}

/* Syntax highlighting suggestions */
.code-keyword { color: #8b5cf6; }
.code-string { color: #22c55e; }
.code-number { color: #f59e0b; }
.code-comment { color: #71717a; }
.code-function { color: #a78bfa; }
```

---

## Animated Background Effects (Optional)

### Dotted Grid Background
```css
.dotted-grid {
  background-image: radial-gradient(circle, rgba(139, 92, 246, 0.03) 1px, transparent 1px);
  background-size: 40px 40px;
  position: fixed;
  inset: 0;
  pointer-events: none;
}
```

### Scanning Lines Animation
```css
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

.scan-line {
  position: fixed;
  width: 100%;
  height: 1px;
  background: linear-gradient(90deg, transparent, rgba(139, 92, 246, 0.08), transparent);
  animation: scanHorizontal 8s linear infinite;
  pointer-events: none;
}
```

### Glowing Orbs (Ambient Light)
```css
.glow-orb {
  position: fixed;
  width: 24rem;
  height: 24rem;
  background: radial-gradient(circle, rgba(139, 92, 246, 0.08), transparent 70%);
  border-radius: 50%;
  filter: blur(60px);
  opacity: 0.15;
  pointer-events: none;
  animation: floatOrb 20s ease-in-out infinite;
}

@keyframes floatOrb {
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
```

---

## Animation Classes

```css
/* Fade In Animation */
@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

.fade-in {
  animation: fadeIn 0.6s ease-out forwards;
}

/* Slide Up Animation */
@keyframes slideUp {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.slide-up {
  animation: slideUp 0.6s ease-out forwards;
}

/* Scale In Animation */
@keyframes scaleIn {
  from {
    opacity: 0;
    transform: scale(0.9);
  }
  to {
    opacity: 1;
    transform: scale(1);
  }
}

.scale-in {
  animation: scaleIn 0.6s ease-out forwards;
}

/* Pulse Animation */
@keyframes pulse {
  0%, 100% {
    opacity: 1;
  }
  50% {
    opacity: 0.5;
  }
}

.pulse {
  animation: pulse 2s ease-in-out infinite;
}
```

---

## Spacing System

```css
/* Padding & Margin Scale */
--space-1: 0.25rem;   /* 4px */
--space-2: 0.5rem;    /* 8px */
--space-3: 0.75rem;   /* 12px */
--space-4: 1rem;      /* 16px */
--space-5: 1.25rem;   /* 20px */
--space-6: 1.5rem;    /* 24px */
--space-8: 2rem;      /* 32px */
--space-10: 2.5rem;   /* 40px */
--space-12: 3rem;     /* 48px */
--space-16: 4rem;     /* 64px */
--space-20: 5rem;     /* 80px */
```

---

## Border Radius

```css
--radius-none: 0;
--radius-sm: 0.125rem;   /* 2px */
--radius-md: 0.25rem;    /* 4px */
--radius-lg: 0.5rem;     /* 8px */
--radius-xl: 0.75rem;    /* 12px */
--radius-2xl: 1rem;      /* 16px */
--radius-full: 9999px;   /* Fully rounded */
```

---

## Shadow System

```css
/* Elevation Shadows */
--shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.5);
--shadow-md: 0 4px 6px rgba(0, 0, 0, 0.5);
--shadow-lg: 0 10px 15px rgba(0, 0, 0, 0.6);
--shadow-xl: 0 20px 25px rgba(0, 0, 0, 0.7);

/* Glow Shadows */
--shadow-purple-sm: 0 0 10px rgba(139, 92, 246, 0.2);
--shadow-purple-md: 0 0 20px rgba(139, 92, 246, 0.3);
--shadow-purple-lg: 0 0 40px rgba(139, 92, 246, 0.4);
```

---

## Transitions

```css
/* Standard Transitions */
--transition-fast: 150ms ease;
--transition-base: 300ms ease;
--transition-slow: 500ms ease;

/* Common Transition Properties */
.transition-all {
  transition: all 300ms ease;
}

.transition-colors {
  transition: background-color 300ms ease, color 300ms ease, border-color 300ms ease;
}

.transition-transform {
  transition: transform 300ms ease;
}

.transition-opacity {
  transition: opacity 300ms ease;
}
```

---

## Responsive Breakpoints

```css
/* Mobile First Approach */
--breakpoint-sm: 640px;   /* Small devices */
--breakpoint-md: 768px;   /* Medium devices */
--breakpoint-lg: 1024px;  /* Large devices */
--breakpoint-xl: 1280px;  /* Extra large devices */
--breakpoint-2xl: 1536px; /* 2X Extra large devices */

/* Example Media Queries */
@media (min-width: 768px) {
  /* Tablet and up */
}

@media (min-width: 1024px) {
  /* Desktop and up */
}
```

---

## Icon Guidelines

### Recommended Icon Libraries
- **Lucide Icons** - https://lucide.dev
- **Heroicons** - https://heroicons.com
- **Phosphor Icons** - https://phosphoricons.com

### Icon Sizes
```css
--icon-xs: 1rem;     /* 16px */
--icon-sm: 1.25rem;  /* 20px */
--icon-md: 1.5rem;   /* 24px */
--icon-lg: 2rem;     /* 32px */
--icon-xl: 3rem;     /* 48px */
```

### Icon Colors
```css
.icon-primary { color: #8b5cf6; }
.icon-secondary { color: #a78bfa; }
.icon-muted { color: #71717a; }
.icon-success { color: #22c55e; }
.icon-error { color: #ef4444; }
.icon-warning { color: #f59e0b; }
```

---

## Accessibility Guidelines

### Focus States
```css
*:focus-visible {
  outline: 2px solid #8b5cf6;
  outline-offset: 2px;
}

button:focus-visible,
a:focus-visible,
input:focus-visible {
  box-shadow: 0 0 0 3px rgba(139, 92, 246, 0.3);
}
```

### Contrast Ratios
- **Primary text on black background**: WCAG AAA compliant (21:1)
- **Purple accent (#8b5cf6) on black**: WCAG AA compliant (4.8:1)
- **Secondary text (#a1a1aa) on black**: WCAG AA compliant (8.8:1)

---

## Loading States

### Spinner
```css
.spinner {
  width: 2rem;
  height: 2rem;
  border: 3px solid rgba(139, 92, 246, 0.2);
  border-top-color: #8b5cf6;
  border-radius: 50%;
  animation: spin 0.8s linear infinite;
}

@keyframes spin {
  to {
    transform: rotate(360deg);
  }
}
```

### Skeleton Loader
```css
.skeleton {
  background: linear-gradient(
    90deg,
    rgba(139, 92, 246, 0.05) 0%,
    rgba(139, 92, 246, 0.1) 50%,
    rgba(139, 92, 246, 0.05) 100%
  );
  background-size: 200% 100%;
  animation: shimmer 1.5s infinite;
}

@keyframes shimmer {
  0% {
    background-position: -200% 0;
  }
  100% {
    background-position: 200% 0;
  }
}
```

---

## Implementation Checklist

### Phase 1: Foundation
- [ ] Set up color variables (CSS custom properties or preprocessor variables)
- [ ] Import and configure JetBrains Mono font
- [ ] Apply base styles (background, text color, font family)
- [ ] Implement dotted grid background

### Phase 2: Core Components
- [ ] Style all button variants (primary, secondary, danger)
- [ ] Create card components (standard, glass effect)
- [ ] Style all form inputs and controls
- [ ] Implement navigation bar
- [ ] Create modal/dialog styles

### Phase 3: Advanced Components
- [ ] Style tables and data displays
- [ ] Create badge and tag components
- [ ] Implement alert/notification styles
- [ ] Add code block styling
- [ ] Create progress bars and loaders

### Phase 4: Animations & Effects
- [ ] Add fade-in, slide-up, scale-in animations
- [ ] Implement scanning line effects (optional)
- [ ] Add glowing orb backgrounds (optional)
- [ ] Configure hover and focus transitions

### Phase 5: Testing & Refinement
- [ ] Test all components in light/dark themes
- [ ] Verify accessibility (contrast ratios, focus states)
- [ ] Test responsive behavior across breakpoints
- [ ] Optimize animation performance
- [ ] Cross-browser testing

---

## Framework-Specific Implementation

### For React/Next.js
```jsx
// Example component structure
const Card = ({ children, className = '', variant = 'default' }) => {
  const baseStyles = 'p-6 transition-all duration-300';
  const variants = {
    default: 'bg-[#0a0a0a] border border-purple-primary/30 hover:border-purple-primary/50',
    glass: 'bg-purple-primary/5 border border-purple-primary/20 backdrop-blur-lg',
  };

  return (
    <div className={`${baseStyles} ${variants[variant]} ${className}`}>
      {children}
    </div>
  );
};
```

### For Vue.js
```vue
<template>
  <div :class="cardClasses">
    <slot />
  </div>
</template>

<script setup>
import { computed } from 'vue';

const props = defineProps({
  variant: {
    type: String,
    default: 'default'
  }
});

const cardClasses = computed(() => {
  const base = 'p-6 transition-all duration-300';
  const variants = {
    default: 'bg-[#0a0a0a] border border-purple-primary/30 hover:border-purple-primary/50',
    glass: 'bg-purple-primary/5 border border-purple-primary/20 backdrop-blur-lg',
  };
  return `${base} ${variants[props.variant]}`;
});
</script>
```

### For Plain HTML/CSS
```html
<!-- Standard Card -->
<div class="card">
  <h3 class="card-title">Card Title</h3>
  <p class="card-content">Card content goes here</p>
</div>

<style>
.card {
  background-color: #0a0a0a;
  border: 1px solid rgba(139, 92, 246, 0.3);
  padding: 1.5rem;
  transition: all 0.3s ease;
}

.card:hover {
  border-color: rgba(139, 92, 246, 0.5);
}

.card-title {
  color: #ffffff;
  font-family: 'JetBrains Mono', monospace;
  font-size: 1.25rem;
  font-weight: 700;
  margin-bottom: 0.5rem;
}

.card-content {
  color: #a1a1aa;
  font-family: 'JetBrains Mono', monospace;
  font-size: 0.875rem;
  line-height: 1.6;
}
</style>
```

---

## Design Principles

### 1. **Minimalism First**
- Use pure black (#000000) as the primary background
- Keep purple accents subtle (low opacity: 5-15%)
- Avoid visual clutter - focus on content

### 2. **Security-Focused Aesthetics**
- Monospace fonts for technical, secure feel
- Minimal borders and separators
- Emphasis on encryption-related terminology

### 3. **Subtle Animations**
- All animations should be smooth (300ms standard)
- Hover effects should be noticeable but not distracting
- Use opacity and transform (GPU-accelerated) over layout changes

### 4. **Consistent Spacing**
- Use spacing scale consistently (multiples of 4px)
- Maintain visual hierarchy through spacing
- Group related elements with proper whitespace

### 5. **High Contrast for Readability**
- Pure white (#ffffff) for primary text
- Ensure WCAG AA compliance minimum
- Use secondary colors sparingly

---

## Common Patterns

### Dashboard Layout
```html
<div class="dashboard">
  <aside class="sidebar">
    <!-- Navigation -->
  </aside>
  <main class="main-content">
    <header class="page-header">
      <!-- Page title and actions -->
    </header>
    <div class="content-area">
      <!-- Main content -->
    </div>
  </main>
</div>
```

### File Upload Card
```html
<div class="upload-card">
  <div class="upload-icon">
    <!-- Upload icon -->
  </div>
  <h3>Drop files here</h3>
  <p class="text-secondary">or click to browse</p>
  <div class="upload-meta">
    <span class="badge badge-primary">AES-256-GCM</span>
  </div>
</div>
```

### Encryption Status Display
```html
<div class="status-card">
  <div class="status-header">
    <div class="status-icon success">
      <!-- Check icon -->
    </div>
    <h3>ENCRYPTED</h3>
  </div>
  <div class="status-details">
    <div class="detail-row">
      <span class="label">File ID:</span>
      <code class="value">a7f3x9k2</code>
    </div>
    <div class="detail-row">
      <span class="label">Encryption:</span>
      <code class="value">AES-256-GCM</code>
    </div>
    <div class="detail-row">
      <span class="label">Access:</span>
      <code class="value">1x (One-time)</code>
    </div>
  </div>
</div>
```

---

## Additional Resources

### Color Contrast Checker
- WebAIM: https://webaim.org/resources/contrastchecker/

### Font Resources
- JetBrains Mono: https://www.jetbrains.com/lp/mono/
- Google Fonts: https://fonts.google.com/specimen/JetBrains+Mono

### Animation Performance
- Use `transform` and `opacity` for best performance
- Avoid animating `width`, `height`, `top`, `left`
- Enable GPU acceleration with `will-change` when needed

### Testing Tools
- Lighthouse (Chrome DevTools) - Performance & Accessibility
- axe DevTools - Accessibility testing
- BrowserStack - Cross-browser testing

---

## Support & Questions

Jika ada pertanyaan atau butuh klarifikasi lebih lanjut tentang implementasi tema ini, silakan hubungi tim development atau lihat:
- Frontend repository untuk referensi live
- Design system documentation
- Component storybook (jika tersedia)

---

**Version:** 1.0
**Last Updated:** 2026-01-03
**Design System:** Øxfile Dark Minimalist Theme
**Primary Color:** Purple (#8b5cf6) on Pure Black (#000000)
