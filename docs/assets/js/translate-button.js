// Кнопка перевода - открывает Google Translate в новой вкладке
document.addEventListener('DOMContentLoaded', function() {
  const button = document.createElement('button');
  button.className = 'translate-floating-btn';
  button.innerHTML = '🌐 Translate to English';
  button.title = 'Открыть перевод в Google Translate';
  
  button.addEventListener('click', function() {
    const currentUrl = window.location.href;
    const translateUrl = `https://translate.google.com/translate?sl=ru&tl=en&u=${encodeURIComponent(currentUrl)}`;
    window.open(translateUrl, '_blank');
  });
  
  document.body.appendChild(button);
});
