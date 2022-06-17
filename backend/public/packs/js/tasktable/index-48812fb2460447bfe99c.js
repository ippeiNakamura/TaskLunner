/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/tasktable/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/tasktable/index.js":
/*!*************************************************!*\
  !*** ./app/javascript/packs/tasktable/index.js ***!
  \*************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

var text_form = document.getElementById('text_form');
text_form.addEventListener('keypress', test_ivent);

function test_ivent(e) {
  var table = document.getElementById('targetTable');
  var currentRow = this.parentElement.parentElement; //Enterキー押下時

  if (e.key === 'Enter') {
    var newRow = table.insertRow(currentRow.rowIndex + 1); //行の追加

    var currentTaskId = currentRow.firstElementChild.innerText; //現在のidを取得

    console.log(currentTaskId);
    var nextTaskId = currentTaskId + 1; //次のidを生成

    var newCell = newRow.insertCell();
    var newText = document.createTextNode(nextTaskId);
    newCell.appendChild(newText);
    newCell = newRow.insertCell();
    var inputForm = document.createElement('input');
    inputForm.type = 'text';
    inputForm.id = 'form' + nextTaskId;
    inputForm.onkeydown = test_ivent;
    newCell.appendChild(inputForm);
    document.getElementById(inputForm.id).focus();
  } //tabキー押下時
  else if (e.key === 'Tab') {
      //子タスクIDを付与する
      //親タスクのIDを取得
      var previousRow = currentRow.previousElementSibling; //前の行を取得

      var parentId = previousRow.firstElementChild.innerText; //親Idを取得
      //子タスクIDの生成

      childId = parentId + ".1"; //子タスクIDの書き換え

      currentRow.firstElementChild.innerText = childId;
    }

  return false;
}

/***/ })

/******/ });
//# sourceMappingURL=index-48812fb2460447bfe99c.js.map