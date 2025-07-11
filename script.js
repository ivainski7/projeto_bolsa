document.addEventListener('DOMContentLoaded', function() {
    // Menu mobile
    const menuToggle = document.querySelector('.menu-toggle');
    const nav = document.querySelector('nav');
    const menuOverlay = document.querySelector('.menu-overlay');
    const body = document.body;
    const hasSubmenuItems = document.querySelectorAll('.has-submenu');
    const header = document.querySelector('header');
    let touchStartY = 0;
    let touchEndY = 0;
    let isMenuOpen = false;
    let touchStartX = 0;
    let touchEndX = 0;

    // Função para fixar o header
    function fixHeader() {
        if (window.innerWidth <= 768 && header) {
            let lastScroll = 0;
            window.addEventListener('scroll', () => {
                const currentScroll = window.pageYOffset;
                if (currentScroll <= 0) {
                    header.style.position = 'fixed';
                    header.style.top = '0';
                }
                lastScroll = currentScroll;
            });
        }
    }
    fixHeader();
    window.addEventListener('resize', fixHeader);

    // DEBUG: Verificar se o menu-toggle e nav estão presentes
    console.log('menu-toggle:', document.querySelector('.menu-toggle'));
    console.log('nav:', document.querySelector('nav'));

    if (menuToggle && nav && menuOverlay) {
        function openMenu() {
            nav.classList.add('active');
            menuOverlay.classList.add('active');
            body.classList.add('menu-open');
            isMenuOpen = true;
            document.body.style.overflow = 'hidden';
            document.body.style.position = 'fixed';
            document.body.style.width = '100%';
            document.body.style.height = '100%';
        }
        function closeMenu() {
            nav.classList.remove('active');
            menuOverlay.classList.remove('active');
            body.classList.remove('menu-open');
            isMenuOpen = false;
            document.body.style.overflow = '';
            document.body.style.position = '';
            document.body.style.width = '';
            document.body.style.height = '';
        }
        function toggleMenu(e) {
            e.preventDefault();
            e.stopPropagation();
            console.log('Clicou no menu-toggle!');
            if (!isMenuOpen) {
                openMenu();
            } else {
                closeMenu();
            }
        }
        menuToggle.addEventListener('click', toggleMenu);
        menuToggle.addEventListener('touchstart', function(e) { e.preventDefault(); }, { passive: false });
        menuToggle.addEventListener('touchend', toggleMenu, { passive: false });
        menuOverlay.addEventListener('click', closeMenu);
        menuOverlay.addEventListener('touchend', closeMenu);
        // window.addEventListener('scroll', function() { if (isMenuOpen) closeMenu(); });
    }

    if (hasSubmenuItems && hasSubmenuItems.length > 0) {
    hasSubmenuItems.forEach(item => {
        const menuItem = item.querySelector('.menu-item');
            if (!menuItem) return;
        const link = menuItem.querySelector('a');
        const arrow = menuItem.querySelector('.submenu-arrow');
        function toggleSubmenu(e) {
            if (window.innerWidth <= 768) {
                e.preventDefault();
                e.stopPropagation();
                const isOpen = item.classList.contains('submenu-active');
                hasSubmenuItems.forEach(otherItem => {
                    if (otherItem !== item) {
                        otherItem.classList.remove('submenu-active');
                        const otherSubmenu = otherItem.querySelector('.submenu');
                            if (otherSubmenu) otherSubmenu.style.maxHeight = '0';
                    }
                });
                item.classList.toggle('submenu-active');
                const submenu = item.querySelector('.submenu');
                if (submenu) {
                        if (!isOpen) submenu.style.maxHeight = submenu.scrollHeight + 'px';
                        else submenu.style.maxHeight = '0';
                    }
                }
            }
        if (arrow) {
            arrow.addEventListener('click', toggleSubmenu);
            arrow.addEventListener('touchend', toggleSubmenu);
        }
            if (!item.querySelector('.submenu') && link) {
            link.addEventListener('click', function(e) {
                const href = this.getAttribute('href');
                if (isMenuOpen) {
                    e.preventDefault();
                    closeMenu();
                        setTimeout(() => { window.location.href = href; }, 300);
                }
            });
        }
    });
    }

    if (nav) {
    const menuLinks = nav.querySelectorAll('a:not(.has-submenu)');
    menuLinks.forEach(link => {
        link.addEventListener('touchstart', function(e) {
            e.preventDefault();
            const href = this.getAttribute('href');
                if (typeof closeMenu === 'function') closeMenu();
                setTimeout(() => { window.location.href = href; }, 300);
        });
    });
    }

    document.addEventListener('touchmove', function(e) {
        if (body.classList.contains('menu-open')) {
            if (nav && !nav.contains(e.target)) {
                e.preventDefault();
            }
        }
    }, { passive: false });

    window.addEventListener('resize', function() {
        if (window.innerWidth > 768 && typeof closeMenu === 'function') {
            closeMenu();
        }
    });

    // Slider de imagens (protegido)
    const sliderImages = document.querySelectorAll('.slider-image');
    const prevBtn = document.querySelector('.slider-btn.prev');
    const nextBtn = document.querySelector('.slider-btn.next');
    const sliderWrapper = document.querySelector('.slider-wrapper');
    let currentSlide = 0;
    let slideInterval;

    function showSlide(index) {
        sliderImages.forEach((img, i) => {
            img.classList.remove('active');
            if (i === index) {
                img.classList.add('active');
            }
        });
    }

    function nextSlide() {
        currentSlide = (currentSlide + 1) % sliderImages.length;
        showSlide(currentSlide);
    }

    function prevSlide() {
        currentSlide = (currentSlide - 1 + sliderImages.length) % sliderImages.length;
        showSlide(currentSlide);
    }

    if (sliderImages.length && sliderWrapper) {
        showSlide(currentSlide);
        if (nextBtn) nextBtn.addEventListener('click', nextSlide);
        if (prevBtn) prevBtn.addEventListener('click', prevSlide);
    sliderWrapper.addEventListener('touchstart', function(e) {
        touchStartX = e.touches[0].clientX;
        clearInterval(slideInterval);
    });
    sliderWrapper.addEventListener('touchmove', function(e) {
        touchEndX = e.touches[0].clientX;
        const diff = touchStartX - touchEndX;
        if (Math.abs(diff) > 50) {
            const translateX = -currentSlide * 100 + (-diff / 5);
            sliderWrapper.style.transform = `translateX(${translateX}%)`;
        }
    });
    sliderWrapper.addEventListener('touchend', function() {
        const diff = touchStartX - touchEndX;
        if (Math.abs(diff) > 50) {
                if (diff > 0) nextSlide();
                else prevSlide();
            }
        sliderWrapper.style.transform = `translateX(-${currentSlide * 100}%)`;
        startAutoSlide();
    });
        // ... (demais eventos do slider, protegidos)
    }

    // Modal de zoom (protegido)
    const modal = document.getElementById('imageModal');
    const modalImg = document.getElementById('modalImage');
    const closeBtn = document.querySelector('.close-modal');
    let initialPinchDistance = 0;
    let currentScale = 1;
    if (modal && modalImg && closeBtn) {
    modalImg.addEventListener('touchstart', function(e) {
        if (e.touches.length === 2) {
            initialPinchDistance = getDistance(e.touches[0], e.touches[1]);
        }
    });
    modalImg.addEventListener('touchmove', function(e) {
        if (e.touches.length === 2) {
            e.preventDefault();
            const currentDistance = getDistance(e.touches[0], e.touches[1]);
            const scale = currentDistance / initialPinchDistance;
            currentScale = Math.max(1, Math.min(3, currentScale * scale));
            modalImg.style.transform = `scale(${currentScale})`;
            initialPinchDistance = currentDistance;
        }
    });
    modalImg.addEventListener('touchend', function() {
        if (currentScale === 1) {
            modalImg.style.transform = 'scale(1)';
        }
    });
    function getDistance(touch1, touch2) {
        return Math.hypot(
            touch2.pageX - touch1.pageX,
            touch2.pageY - touch1.pageY
        );
    }
        // ... (demais eventos do modal)
        }

    // Scroll to top (protegido)
    const scrollTopButton = document.getElementById('scrollTop');
    if (scrollTopButton) {
    window.addEventListener('scroll', function() {
        if (window.pageYOffset > 300) {
            scrollTopButton.classList.add('visible');
        } else {
            scrollTopButton.classList.remove('visible');
        }
    });
    scrollTopButton.addEventListener('click', function() {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        });
    }

    // Paginação (protegida)
    function setupPagination() {
        const productCards = document.querySelectorAll('.product-card');
        const pagination = document.querySelector('.pagination');
        const prevBtn = document.querySelector('.prev-page');
        const nextBtn = document.querySelector('.next-page');
        const currentPageSpan = document.querySelector('.current-page');
        const totalPagesSpan = document.querySelector('.total-pages');
        if (!productCards.length || !pagination) return;
        let currentPage = 1;
        const productsPerPage = 9;
        const totalProducts = productCards.length;
        const totalPages = Math.ceil(totalProducts / productsPerPage);
        if (totalProducts > productsPerPage) {
            pagination.classList.add('visible');
        }
        if (currentPageSpan) currentPageSpan.textContent = currentPage;
        if (totalPagesSpan) totalPagesSpan.textContent = totalPages;
        function showProducts() {
            const startIndex = (currentPage - 1) * productsPerPage;
            const endIndex = startIndex + productsPerPage;
            productCards.forEach((card, index) => {
                if (index >= startIndex && index < endIndex) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
            if (prevBtn) prevBtn.disabled = currentPage === 1;
            if (nextBtn) nextBtn.disabled = currentPage === totalPages;
        }
        if (prevBtn) {
            prevBtn.addEventListener('click', () => {
                if (currentPage > 1) {
                    currentPage--;
                    if (currentPageSpan) currentPageSpan.textContent = currentPage;
                    showProducts();
                }
            });
        }
        if (nextBtn) {
            nextBtn.addEventListener('click', () => {
                if (currentPage < totalPages) {
                    currentPage++;
                    if (currentPageSpan) currentPageSpan.textContent = currentPage;
                    showProducts();
                }
            });
        }
        showProducts();
    }
    setupPagination();

    // FILTRO MOBILE - SEMPRE EXECUTAR
    var openFilterModal = document.getElementById('openFilterModal');
    var filterModal = document.getElementById('filterModal');
    var closeFilterModal = document.getElementById('closeFilterModal');
    if (openFilterModal && filterModal && closeFilterModal) {
        openFilterModal.addEventListener('click', function(e) {
            e.preventDefault();
            filterModal.classList.add('active');
        });
        closeFilterModal.addEventListener('click', function(e) {
            e.preventDefault();
            filterModal.classList.remove('active');
        });
        filterModal.addEventListener('click', function(e) {
            if (e.target === filterModal) {
                filterModal.classList.remove('active');
            }
        });
    }

    // Botão X azul para fechar o menu mobile (funciona para todos os botões na página)
    var closeMenuMobileBtns = document.querySelectorAll('.close-menu-mobile');
    if (closeMenuMobileBtns.length && typeof closeMenu === 'function') {
        closeMenuMobileBtns.forEach(function(btn) {
            btn.addEventListener('click', function(e) {
                e.preventDefault();
                closeMenu();
            });
        });
    }
}); 