<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
/*!
/**
 * Monkey patch jQuery 1.3.1+ to add support for setting or animating CSS
 * scale and rotation independently.
 * https://github.com/zachstronaut/jquery-animate-css-rotate-scale
 * Released under dual MIT/GPL license just like jQuery.
 * 2009-2012 Zachary Johnson www.zachstronaut.com
 */
(function ($) {
    // Updated 2010.11.06
    // Updated 2012.10.13 - Firefox 16 transform style returns a matrix rather than a string of transform functions.  This broke the features of this jQuery patch in Firefox 16.  It should be possible to parse the matrix for both scale and rotate (especially when scale is the same for both the X and Y axis), however the matrix does have disadvantages such as using its own units and also 45deg being indistinguishable from 45+360deg.  To get around these issues, this patch tracks internally the scale, rotation, and rotation units for any elements that are .scale()'ed, .rotate()'ed, or animated.  The major consequences of this are that 1. the scaled/rotated element will blow away any other transform rules applied to the same element (such as skew or translate), and 2. the scaled/rotated element is unaware of any preset scale or rotation initally set by page CSS rules.  You will have to explicitly set the starting scale/rotation value.
    
    function initData($el) {
        var _ARS_data = $el.data('_ARS_data');
        if (!_ARS_data) {
            _ARS_data = {
                rotateUnits: 'deg',
                scale: 1,
                rotate: 0
            };
            
            $el.data('_ARS_data', _ARS_data);
        }
        
        return _ARS_data;
    }
    
    function setTransform($el, data) {
        $el.css('transform', 'rotate(' + data.rotate + data.rotateUnits + ') scale(' + data.scale + ',' + data.scale + ')');
    }
    
    $.fn.rotate = function (val) {
        var $self = $(this), m, data = initData($self);
                        
        if (typeof val == 'undefined') {
            return data.rotate + data.rotateUnits;
        }
        
        m = val.toString().match(/^(-?\d+(\.\d+)?)(.+)?$/);
        if (m) {
            if (m[3]) {
                data.rotateUnits = m[3];
            }
            
            data.rotate = m[1];
            
            setTransform($self, data);
        }
        
        return this;
    };
    
    // Note that scale is unitless.
    $.fn.scale = function (val) {
        var $self = $(this), data = initData($self);
        
        if (typeof val == 'undefined') {
            return data.scale;
        }
        
        data.scale = val;
        
        setTransform($self, data);
        
        return this;
    };

    // fx.cur() must be monkey patched because otherwise it would always
    // return 0 for current rotate and scale values
    var curProxied = $.fx.prototype.cur;
    $.fx.prototype.cur = function () {
        if (this.prop == 'rotate') {
            return parseFloat($(this.elem).rotate());
            
        } else if (this.prop == 'scale') {
            return parseFloat($(this.elem).scale());
        }
        
        return curProxied.apply(this, arguments);
    };
    
    $.fx.step.rotate = function (fx) {
        var data = initData($(fx.elem));
        $(fx.elem).rotate(fx.now + data.rotateUnits);
    };
    
    $.fx.step.scale = function (fx) {
        $(fx.elem).scale(fx.now);
    };
    
    /*
    
    Starting on line 3905 of jquery-1.3.2.js we have this code:
    
    // We need to compute starting value
    if ( unit != "px" ) {
        self.style[ name ] = (end || 1) + unit;
        start = ((end || 1) / e.cur(true)) * start;
        self.style[ name ] = start + unit;
    }
    
    This creates a problem where we cannot give units to our custom animation
    because if we do then this code will execute and because self.style[name]
    does not exist where name is our custom animation's name then e.cur(true)
    will likely return zero and create a divide by zero bug which will set
    start to NaN.
    
    The following monkey patch for animate() gets around this by storing the
    units used in the rotation definition and then stripping the units off.
    
    */
    
    var animateProxied = $.fn.animate;
    $.fn.animate = function (prop) {
        if (typeof prop['rotate'] != 'undefined') {
            var $self, data, m = prop['rotate'].toString().match(/^(([+-]=)?(-?\d+(\.\d+)?))(.+)?$/);
            if (m && m[5]) {
                $self = $(this);
                data = initData($self);
                data.rotateUnits = m[5];
            }
            
            prop['rotate'] = m[1];
        }
        
        return animateProxied.apply(this, arguments);
    };
})(jQuery);

function turnPlate(target) {
	document.querySelector(".roulPan").style.removeProperty("transition-duration");
	document.querySelector(".roulPan").style.removeProperty("transform");
	setTimeout(function() {
		var angle = 1800;
		if(target == 1) {
			angle += Math.random()*40+10;
		} else if(target == 2) {
			angle += Math.random()*40+70;
		} else if(target == 3) {
			angle += Math.random()*40+130;
		} else if(target == 4) {
			angle += Math.random()*40+190;
		} else if(target == 5) {
			angle += Math.random()*40+250;
		} else if(target == 6) {
			angle += Math.random()*40+310;
		}
		
		$('.roulPan').css("transition-duration", "3s");
		//$(".roulPan").rotate(angle);
		$(".roulPan").css("transform", "rotate(" + angle + "deg)");
		
		setTimeout(function() {
			if(target == 1) alert("10% 할인 쿠폰 당첨입니다!\n축하합니다.");
			else if(target == 2) alert("30% 할인 쿠폰 당첨입니다!\n축하합니다.");
			else if(target == 3) alert("20% 할인 쿠폰 당첨입니다!\n축하합니다.");
			else if(target == 4) alert("아쉽지만 꽝 입니다...\n내일 도전해주세요!");
			else if(target == 5) alert("5% 할인 쿠폰 당첨입니다!\n축하합니다.");
			else if(target == 6) alert("대박!! 대박!!\n50% 할인 쿠폰 당첨입니다!\n축하합니다.");
		}, 3000);
	}, 50);
}

function goRoulette() {
	var ticket = '${requestScope.ticket}';
	if(ticket == 'true') {
		$.ajax({
			url: './rouletteAjax.do',
			type: 'post',
			data: {'customerNo': '${sessionScope.customerNo}'},
			dataType: 'text',
			success: function(data) {
				if(data == 1) turnPlate(1);
				else if(data == 2) turnPlate(2);
				else if(data == 3) turnPlate(3);
				else if(data == 4) turnPlate(4);
				else if(data == 5) turnPlate(5);
				else if(data == 6) turnPlate(6);
				else if(data == -1 || data == 'noTicket') alert("사용가능한 룰렛 응모권이 없습니다!\n내일 도전하세요!");
			}
		});
	} else {
		alert("사용가능한 룰렛 응모권이 없습니다!\n내일 도전하세요!");
	}
}

</script>
<style>
	div {
		box-sizing: border-box;
	}
	#mainDiv {
		width: 1000px;
		min-height: 600px;
		margin: 0 auto;
		margin-top: 80px;
		position: relative;
	}
	#rouletteDiv {
		width: 500px;
		margin: 0 auto;
	}
	.roulPan {
		background: url('./event/turningPlate.png');
		width: 500px;
		height: 500px;
		background-size: 500px;
		border-radius: 360px;
		cursor:pointer;
	}
	#cursorImg {
		width: 70px;
	    position: relative;
	    left: 214px;
	    top: 20px;
	    z-index: 500;
	    transform: rotate(90deg);
	}
	#rouletteBtnDiv {
		text-align: center;
		margin: 30px auto;
	}
	#rouletteBtnDiv button {
		background: #19ce60;
		font-family: Binggrae-Bold;
		font-size: 1rem;
		color: white;
		border: none;
		border-radius: 12px;
		width: 270px;
		height: 35px;
		transition-duration: 1s;
		opacity: 0.7;
		cursor: pointer;
	}
	#rouletteBtnDiv button:hover {
		opacity: 1;
	}
</style>
<body>
	<div id="mainDiv">
		<h2 style="line-height: 10px; margin-top: 100px; text-align: center;">룰렛을 돌려 할인 쿠폰 받아가세요~</h2>
		<h2 style="line-height: 10px; text-align: center;">룰렛 이용권은 로그인시 하루 1회 지급됩니다.</h2>
		<h2 style="line-height: 10px; text-align: center;">지급된 룰렛 이용권은 최대 1개로 누적 되지 않습니다.</h2>
		<div id="rouletteDiv">
			<img id="cursorImg" src="./event/arrow.svg">
			<div class="roulPan">
				<div style="width: 50px;font-size: 2rem;position: relative;top: 370px;left: 290px;transform: rotate(135deg);">꽝</div>
				<div style="width: 50px;font-size: 2rem;position: relative;top: 190px;left: 390px;transform: rotate(90deg);">5%</div>
				<div style="width: 50px;font-size: 2rem;position: relative;top: 0px;left: 140px;transform: rotate(335deg);">10%</div>
				<div style="width: 50px;font-size: 2rem;position: relative;top: 230px;left: 150px;transform: rotate(215deg);">20%</div>
				<div style="width: 50px;font-size: 2rem;position: relative;top: 50px;left: 60px;transform: rotate(270deg);">30%</div>
				<div style="width: 50px;font-size: 2rem;position: relative;top: -140px;left: 280px;transform: rotate(35deg);">50%</div>
			</div>
		</div>
		
		<div id="rouletteBtnDiv">
			<c:if test="${requestScope.ticket == 'true' }">
				<button type="button" onclick="goRoulette();">룰렛 돌리기</button>
			</c:if>
			<c:if test="${requestScope.ticket != 'true' }">
				<button type="button" disabled>이용권이 없습니다.</button>
			</c:if>
		</div>
		
	</div>
</body>
</html>