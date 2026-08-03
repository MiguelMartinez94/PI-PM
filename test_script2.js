
function closeBracketModal() {
    document.getElementById('bracketModal').classList.remove('active');
}

function renderBracket(data) {
    let html = `<div style="text-align: center; margin-bottom:1rem;"><h3 style="color:var(--dark);">${data.message || 'Cuadro de Eliminatorias'}</h3></div>`;
    html += `<div class="tournament-bracket" style="overflow-x: auto; max-width: 100%;">`;
    
    let matches = data.matches || [];
    let totalMatches = matches.length;
    let firstRoundCount = Math.ceil(totalMatches / 2); 
    
    let currentIndex = 0;
    let currentRoundCount = firstRoundCount;
    
    while(currentRoundCount >= 1 && currentIndex < totalMatches) {
        html += `<div class="bracket-round">`;
        for(let i=0; i<currentRoundCount; i+=2) {
            html += `<div class="bracket-match-wrapper">`;
            
            let m1 = matches[currentIndex];
            let arb1 = m1.arbitro && m1.arbitro !== 'Sin árbitro' ? `<div style="font-size:0.75rem; color:var(--text-muted); padding:0.2rem 0.5rem;">${m1.arbitro}</div>` : '';
            html += `
            <div class="bracket-match">
                <div class="bracket-team">${m1.local || 'Por definir'}</div>
                <div class="bracket-team">${m1.visita || 'Por definir'}</div>
                ${arb1}
            </div>`;
            currentIndex++;
            
            if (i+1 < currentRoundCount && currentIndex < totalMatches) {
                let m2 = matches[currentIndex];
                let arb2 = m2.arbitro && m2.arbitro !== 'Sin árbitro' ? `<div style="font-size:0.75rem; color:var(--text-muted); padding:0.2rem 0.5rem;">${m2.arbitro}</div>` : '';
                html += `
                <div class="bracket-match">
                    <div class="bracket-team">${m2.local || 'Por definir'}</div>
                    <div class="bracket-team">${m2.visita || 'Por definir'}</div>
                    ${arb2}
                </div>`;
                currentIndex++;
            }
            html += `</div>`;
        }
        html += `</div>`;
        
        currentRoundCount = Math.floor(currentRoundCount / 2);
    }
    
    if (firstRoundCount >= 2) {
        html += `<div class="bracket-round"><div class="bracket-match-wrapper">
        <div class="bracket-match" style="border-color: var(--primary-color);">
            <div class="bracket-team" style="color:var(--primary-color); font-weight:bold;">🏆 CAMPEÓN</div>
        </div></div></div>`;
    }
    
    html += `</div>`;
    document.getElementById('bracket-container').innerHTML = html;
}

function verCuadroEliminatorias() {
    document.getElementById('bracketModal').classList.add('active');
    document.getElementById('bracket-container').innerHTML = '<div style="text-align: center; color: var(--text-muted); padding: 2rem;"><i class="ri-loader-4-line ri-spin" style="font-size:2rem;"></i><br>Cargando cuadro...</div>';
    
    const urlParams = new URLSearchParams(window.location.search);
    let tId = urlParams.get('torneo_id');
    if (!tId) {
        const tIdElem = document.getElementById('torneo_id_val');
        if (tIdElem) tId = tIdElem.value;
        else tId = window.location.pathname.split('/').pop();
    }
    
    if (isNaN(tId) || !tId) { tId = 7; }
    
    fetch(`/${tId}/llaves`)
    .then(res => res.json())
    .then(data => {
        if(data.success && data.matches && data.matches.length > 0) {
            renderBracket(data);
        } else {
            document.getElementById('bracket-container').innerHTML = '<div style="text-align: center; color: var(--text-muted); padding: 2rem;">Aún no se ha generado un cuadro de eliminatorias para este torneo.</div>';
        }
    })
    .catch(err => {
        document.getElementById('bracket-container').innerHTML = '<div style="text-align: center; color: red; padding: 2rem;">Error al cargar el cuadro.</div>';
    });
}
