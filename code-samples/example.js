const roleId = $('#role_id').val();

// ----------------------------------------------------- GET DATA //
const getData = () => {
	$('.spinner').show();

	$.getJSON('/ajax/data/get_items', {
			startDate: $("input[name='start_date']").val(),
			endDate: $("input[name='end_date']").val(),
		},
		data => {
			$('body').off('hover');
			initGraph(data.item_data);
			$('.spinner').hide();
		}
	);
};

// ----------------------------------------------------- DATA GRAPH //
const initGraph = items => {
	// Set negative numbers to zero //
	Object.keys(items).forEach(date => {
		items[date] = items(date) > 0 ? items[date] : 0;
	});

	items.forEach((item, index) => {
		chart += '<div class="item">';
		chart += `<div class="name">${item.name}</div>`;
		chart += `<div class="value">${item.revenue}</div>`;
		chart += '<div class="progress-container">';
		chart += `<div class="progress-bar" style="width: ${item.y} %; background-color: ${graphColor[index]}"></div>`;
		chart += '</div>';
		chart += '</div>';
	});

	$('.items-graph').html(chart);

	const options = {
		chart: {
			backgroundColor: '#000000',
			data: Object.values(items),
			height: 317,
			margin: [0, 0, 0, 0],
			renderTo: 'item-graph',
			type: 'bar',
		},
		tooltip: {
			enabled: true,
			formatter() {
        const value = this.y.toFixed(2).replace(/(\d) (?=(\d\d\d)+(?!\d))/g, '$1,');
				let html = `<strong>${Object.keys(items)[this.key]}</strong>`;
				html += '<br>';
				html += `<strong>$${value}</strong>`;

				return html;
			},
		},
		legend: {
			enabled: false,
		},
	};

	chart = new Highcharts.Chart(options);
}

window.onkeydown = function(e) {
	return !(e.keyCode === 32 && e.target === document.body);
};
