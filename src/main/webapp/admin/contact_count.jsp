<%@ page import="java.util.*" %>
<%@ page import="gv.dao.AdminDao" %>


<style>
#monthlyChart {
  max-width: 300px;
  max-height: 250px;
  margin:10px;
  background-color: #83afd4;
}
</style>

<%
    AdminDao dao1 = new AdminDao();
    LinkedHashMap<String, Integer> yearMonthMap = dao1.getMonthlyContactCounts();

    String labels = "";
    String values = "";

    for (Map.Entry<String, Integer> entry : yearMonthMap.entrySet()) {
        labels += "'" + entry.getKey() + "',";   // e.g., '2025-01'
        values += entry.getValue() + ",";
    }

    // Remove trailing commas
    if (!labels.isEmpty()) labels = labels.substring(0, labels.length() - 1);
    if (!values.isEmpty()) values = values.substring(0, values.length() - 1);
%>



<div style="width: 100%; overflow-x: auto;">
    <canvas id="monthlyChart"></canvas>
</div>








<script>
window.addEventListener('load', function () {
    const ctx1 = document.getElementById('monthlyChart').getContext('2d');
    new Chart(ctx1, {
        type: 'bar',
        data: {
            labels: [<%= labels %>],
            datasets: [{
                label: 'Contacts per Month',
                data: [<%= values %>],
                backgroundColor: 'rgba(54, 162, 235, 0.6)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 0.7,
                maxBarThickness: 30
            }]
        },
        options: {
            scales: {
                x: {
                    categoryPercentage: 1.0,
                    barPercentage: 0.4
                },
                y: {
                    beginAtZero: true,
                    max: 10,
                    ticks: {
                        stepSize: 1
                    }
                }
            }
        }
    });
});

</script>