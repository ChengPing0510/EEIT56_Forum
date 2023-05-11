<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
<link href="https://unpkg.com/vue3-easy-data-table/dist/style.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/vue@3.2.1/dist/vue.global.js"></script>
<script src="https://unpkg.com/vue3-easy-data-table"></script>
<style>
  .my-table {
    width: 800px;
    height: 600px;
    border: 1px solid black;
  },
  .my-table thead th, .my-table tbody td {
    text-align: center;
}
</style>
</head>
<body>
<div id="app">
  <easy-data-table
    :headers="headers"
    :items="items"
     class="my-table"
  />
</div>
<script>
  const App = {
    components: {
      EasyDataTable: window['vue3-easy-data-table'],
    },
    data () {
      return {
        headers: [
          { text: "PLAYER", value: "player" },
          { text: "TEAM", value: "team"},
          { text: "NUMBER", value: "number"},
          { text: "POSITION", value: "position"},
          { text: "HEIGHT", value: "indicator.height"},
          { text: "WEIGHT (lbs)", value: "indicator.weight", sortable: true},
          { text: "LAST ATTENDED", value: "lastAttended", width: 200},
          { text: "COUNTRY", value: "country"},
        ],
        items: [
          { player: "Stephen Curry", team: "GSW", number: 30, position: 'G', indicator: {"height": '6-2', "weight": 185}, lastAttended: "Davidson", country: "USA"},
          { player: "Lebron James", team: "LAL", number: 6, position: 'F', indicator: {"height": '6-9', "weight": 250}, lastAttended: "St. Vincent-St. Mary HS (OH)", country: "USA"},
          { player: "Kevin Durant", team: "BKN", number: 7, position: 'F', indicator: {"height": '6-10', "weight": 240}, lastAttended: "Texas-Austin", country: "USA"},
          { player: "Giannis Antetokounmpo", team: "MIL", number: 34, position: 'F', indicator: {"height": '6-11', "weight": 242}, lastAttended: "Filathlitikos", country: "Greece"},
        ],
      }
    },
  };
  Vue.createApp(App).mount('#app');
</script>
</body>
</html>