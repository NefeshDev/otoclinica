const campos = ['servico', 'medico', 'data', 'horario', 'convenio'];

campos.forEach(campoId => {
    const campo = document.getElementById(campoId);
    
    if (campo) {
        campo.addEventListener('change', function() {
            if (this.value !== '') {
                // Remove checkmark anterior
                const checkmarkAnterior = this.parentElement.querySelector('.checkmark-icon');
                if (checkmarkAnterior) {
                    checkmarkAnterior.remove();
                }
                
                // Esconde a seta do select
                this.style.backgroundImage = 'none';
                
                // Cria novo checkmark
                const checkmark = document.createElement('span');
                checkmark.classList.add('checkmark-icon');
                checkmark.innerHTML = '<i class="fas fa-check-circle"></i>';
                this.parentElement.appendChild(checkmark);
            } else {
                // Se desselecionar, mostra a seta de novo
                this.style.backgroundImage = "url(\"data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%234a5568' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e\")";
            }
        });
    }
});