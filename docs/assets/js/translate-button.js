// Перевод через модальное окно с Google Translate
document.addEventListener('DOMContentLoaded', function() {
  // Создаём кнопку
  const button = document.createElement('button');
  button.className = 'translate-floating-btn';
  button.innerHTML = '🌐 Перевести на English';
  button.title = 'Перевести страницу на английский';
  
  // Создаём модальное окно
  const modal = document.createElement('div');
  modal.className = 'translate-modal';
  modal.innerHTML = `
    <div class="translate-modal-content">
      <div class="translate-modal-header">
        <h3>Перевод на английский</h3>
        <button class="translate-modal-close">&times;</button>
      </div>
      <div class="translate-modal-body">
        <iframe id="translate-iframe" src="" frameborder="0"></iframe>
      </div>
    </div>
  `;
  
  // Обработчик клика на кнопку
  button.addEventListener('click', function() {
    const currentUrl = encodeURIComponent(window.location.href);
    const translateUrl = `https://translate.google.com/translate?sl=ru&tl=en&u=${currentUrl}`;
    document.getElementById('translate-iframe').src = translateUrl;
    modal.style.display = 'flex';
  });
  
  // Закрытие модального окна
  modal.querySelector('.translate-modal-close').addEventListener('click', function() {
    modal.style.display = 'none';
    document.getElementById('translate-iframe').src = '';
  });
  
  // Закрытие по клику вне модалки
  modal.addEventListener('click', function(e) {
    if (e.target === modal) {
      modal.style.display = 'none';
      document.getElementById('translate-iframe').src = '';
    }
  });
  
  // Добавляем элементы на страницу
  document.body.appendChild(button);
  document.body.appendChild(modal);
});
