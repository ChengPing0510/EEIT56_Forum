<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>神明便利店-抽籤</title>
<link rel="icon" type="image/png" href="front_index/img/logo.png" />
<link href="//cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" rel="stylesheet" />
<link rel="stylesheet" href="/front_index/css/bootstrap.css" />
<link rel="stylesheet" href="/front_index/css/flaticon.css" />
<link rel="stylesheet" href="/front_index/css/themify-icons.css" />
<link rel="stylesheet"
    href="/front_index/vendors/owl-carousel/owl.carousel.min.css" />
<link rel="stylesheet"
    href="/front_index/vendors/nice-select/css/nice-select.css" />
<link rel="stylesheet" href="/front_index/css/style.css" />
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://kit.fontawesome.com/e136b47e13.js" crossorigin="anonymous"></script>
<style>
  .center-div {
    text-align: center;
    margin: auto;
    width: 50%; /* 可以設定為寬度 */
  }
  body{background:#363636;} 
.centered-wrap {
  position: absolute;
  left: 50%;
  top: 85%;
  transform: translate(-50%, -50%);
  z-index: 1;
}
/* 定義一個卡片的容器，寬度為 200px、高度為 280px，設定為相對定位。 */
.card-wrap{
  width:330px;
  height:330px;
  position:relative; 
}
.card{
  position:absolute;
  width:100%;
  height:100%;
  /*preserve the back when fliping*/
  transform-style:preserve-3d;
  transition:0.3s all ease;
  box-shadow:0px 0px 10px rgba(10,10,0.8);
}
.card.flip{
  transform:rotateY(180deg);
}
/*front card*/
.card-front{
  border-radius:5px;
  position:absolute;
  background:#e8e8e8;
  width:100%;
  height:100%;
  /*hide backface*/
  backface-visibility:hidden;
  color:#333;
  font-size:1.5rem;
}
.card-front img{
  display:block;
  position:relative;
  left:0%;
  top:0%;
  width:330px;
  height:330px;
/*   transform:translate(-50%,-50%); */
}
/*back card*/
.card-back {
/*   background-image: url(); */
  background-repeat: no-repeat;
  background-size: cover;
  border-radius: 5px;
  position: absolute;
  width: 100%;
  height: 100%;
  backface-visibility: hidden;
  color: #333;
  font-size: 1.5rem;
  transform: rotateY(180deg);
}
p {
  position: relative;
  left: 37%;
  top: 500%;
  width: 30%;
}
</style>
</head>
<body>
    <jsp:include page="/front_index/index-FrontToTopMVC.jsp" />
    <div style="height: 500px;">
        <div class="center-div" >
        <h1>運勢抽籤</h1>
    <p id="result"></p>
	</div>
<div class="centered-wrap" >
  <div class="card-wrap">
    <div class="card">
        <div class="card-front">
            <div>
                <img src="front_index/img/photoforme3.jpg" >
            </div>
        </div>
        <div class="card-back">
        <div class="card-front"><span id="span-element">A</span></div>
            <p id="result"></p>
        </div>
    </div>
</div>
</div>
</div>
<script>
        
        document.querySelectorAll('.card').forEach(card => {
        	  card.addEventListener('click', () => {
        	    card.classList.toggle('flip');
        	    
        	    var prizes = [
                	"大吉:勇敢與衝勁是你本週被賦予的神力，大多數事情都能被你高效率高品質的處理好。即便遇到難題對你而言只是一個小障礙，很快你就能夠通過自我調整找到處理它的力量。",
                	"大吉:愛情會以穩健的態勢成長，你與戀人互相扶持的相處態度是讓戀情成長的最佳養料；單身者不會因為一個人而感到孤單，因為近期常會有其他單身朋友陪伴。",
                	"不明:塞翁失馬焉知非福，財運就潛藏在看似倒霉的事件內。如丟了一台舊手機卻有人主動送來新的，開車與人發生擦撞，錯在對方，修復後還能賺上一小筆。",
                	"小吉:較好的愛情運讓單身朋友最為受益，隨著人氣的上升你漸漸能夠感覺到有一兩個異性在你身邊穿梭，曖昧的氣味也越來越濃；有伴者獲得的異性助力會要比平時多。",
                	"小兇:對工作學習的怠倦感襲上心頭，拖拉的症狀漸漸顯現，不能按時交作業必然少不了被上司或老師責罵。多想些好的結果來激勵自己，一旦打起精神來便能驅趕走拖拉現象。",
                	"小兇:財運薄弱，對金錢的敏銳度降低，這段時間易坐守，不要輕易出手。若有投資，需時刻關注相關市場行情，對突來的訊息真偽也要小心甄別，可別因衝動而誤事。",
                	"大吉:金錢靈感四溢的一週，妙點子讓好消息頻傳，如短期投資有所回報，新的項目上線立刻獲得收益等。重大的財運機遇與校園有關，是你動腦筋出主意和求財的方向。",
                	"小兇:財運薄弱，對金錢的敏銳度降低，這段時間易坐守，不要輕易出手。若有投資，需時刻關注相關市場行情，對突來的訊息真偽也要小心甄別，可別因衝動而誤事。",
                	"小兇:總是重複做著相同的事情成為了你這一週的工作狀態，枯燥自然也難以避免，工作效率也容易下滑。感覺乏味的時候可以透過聊聊天、做些喜患的事情等的方式進行調劑。",
                	"大吉:戀愛百分百的一週，單身者透過網路能夠結識到特別聊得來的異性朋友；戀愛中的人與戀人每一次相聚都充滿期待和快樂。",
                	"大吉:好運降臨，你的愛情世界也將釋放出新的光彩；工作效率較高，許多事都能超前完成；理財有方，可以確保收支都會在你的掌控之內。",
                	"大吉:許多事情正朝你預期的方向發展，你所付出的每一份辛勞都能展現它的價值。不要因為一時看不到效果就否定自己或他人所做的，只有堅持到最後才能嘗到果實。",
                	"大吉:單身者有時間不妨多安排戶外娛樂活動，或是時常到郊外走一走，容易有艷遇喔！",
                	"小吉:金錢回收的時刻，守財力特別強，即便花錢買東西都容易買到物超所值的好東西！",
                	"不明:總運一般，感情有升溫的跡象，可以增加約會的次數；工作令你感到有些乏味，可以通過與同事聊天的方式調劑；求財阻礙多，小心掉進騙子的陷阱中。",
                	"不明:想放飛自由，但現實可能不允許",
                	"小兇:在學、事業方面，會存在對於自己的未來感到無力的狀況，面對目前現況延伸的未來開始感到無力且不知道自己能做些什麼，也有可能在職場上與他人發生口角，所以下週記得要好好管理自己的情緒會比較好。",
                	"小吉:感情世界將變得有趣許多，你將開始懂得為感情增添一點色彩，也更加地懂得溝通的重要性，讓另一半在這段感情中感到十分地受到尊重，連帶將提升兩人之間愛情的親密程度。",
                	"大吉:過往束縛著你的事情都在下週晴朗許多，手邊的事情在不易受到阻礙，對於自己的目標也更加地明確，面對事情時能進行與處理得游刃有餘，是個還不錯的一週。",
                	"小吉:會有一些偏財，可儲蓄起來，以備不時之需。",
                	"小吉:與家人在一起的時間增多，與家人聊學習、工作和生活，分享彼此的想法，收穫頗多。",
                	"小吉:思路清晰，是學習新知、提高技能的好時機，可考慮學習進修之事。",
                	"大吉:程式寫得異常順利,遇到的BUG迎刃而解有如CODE之神附身,這段時間可以多寫程式把進度超前。",
                	"大凶:你死定了!專案完全沒辦法在時間內寫完,所有想得到的甚至出現完全沒想過的BUG都會出現,看是要放乖乖還是斗內我們網站自己選",
                	"大吉:近期有機會表現自己的才華及能力。尤其是在公開場合，可以輕鬆的面對各種情況，因此不論是工作還是生活方面，都能很樂觀的展現自己，並贏得他人的眼光。",
                	"小吉:很多幸運的事會發生，保持樂觀的心，大部份能心想事成。"
                	];
    			
                var result = Math.floor(Math.random() * prizes.length);
                document.getElementById("span-element").innerHTML = prizes[result];
        	  });
        	});
        
        
    </script>

	<jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />
</body>
</html>