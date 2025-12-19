function buildYearSelect(selectId, startYear, endYear, selectedYear) 
{
    const select = document.getElementById(selectId);
    if (!select) return;

    select.innerHTML = '<option value="">Pilih Tahun</option>';

    for (let year = endYear; year >= startYear; year--) 
    {
        const opt = document.createElement('option');
        opt.value = year;
        opt.textContent = year;
        if (selectedYear && year === selectedYear) 
        {
            opt.selected = true;
        }
        select.appendChild(opt);
    }
}

function validationRangeYear(selectYearStartId, selectYearEndId)
{
    document.getElementById(selectYearStartId)?.addEventListener('change', function () {
        const from = parseInt(this.value || 0);
        const toSelect = document.getElementById(selectYearEndId);

        if (!toSelect) return;

        [...toSelect.options].forEach(opt => {
            const v = parseInt(opt.value || 0);
            opt.disabled = v && v < from;
        });
    });
}