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

throw new Error("Module build failed (from ./node_modules/babel-loader/lib/index.js):\nSyntaxError: /Users/ippeinakamura/Desktop/TaskLunner/backend/app/javascript/packs/tasktable/index.js: Identifier 'newRow' has already been declared (17:20)\n\n  15 |         newCell.appendChild(newText);\n  16 |\n> 17 |                 let newRow = table.insertRow();\n     |                     ^\n  18 |         let newCell = newRow.insertCell();\n  19 |         let inputForm = document.createElement('input')\n  20 |         inputForm.type = 'text';\n    at Parser._raise (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:776:17)\n    at Parser.raiseWithData (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:769:17)\n    at Parser.raise (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:737:17)\n    at ScopeHandler.checkRedeclarationInScope (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:1453:12)\n    at ScopeHandler.declareName (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:1419:12)\n    at Parser.checkLVal (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:10261:24)\n    at Parser.parseVarId (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:12949:10)\n    at Parser.parseVar (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:12924:12)\n    at Parser.parseVarStatement (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:12741:10)\n    at Parser.parseStatementContent (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:12327:21)\n    at Parser.parseStatement (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:12260:17)\n    at Parser.parseBlockOrModuleBlockBody (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:12846:25)\n    at Parser.parseBlockBody (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:12837:10)\n    at Parser.parseBlock (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:12821:10)\n    at Parser.parseStatementContent (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:12336:21)\n    at Parser.parseStatement (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:12260:17)\n    at Parser.parseIfStatement (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:12620:28)\n    at Parser.parseStatementContent (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:12305:21)\n    at Parser.parseStatement (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:12260:17)\n    at Parser.parseBlockOrModuleBlockBody (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:12846:25)\n    at Parser.parseBlockBody (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:12837:10)\n    at Parser.parseBlock (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:12821:10)\n    at Parser.parseFunctionBody (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:11778:24)\n    at Parser.parseFunctionBodyAndFinish (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:11762:10)\n    at /Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:12979:12\n    at Parser.withTopicForbiddingContext (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:12074:14)\n    at Parser.parseFunction (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:12978:10)\n    at Parser.parseFunctionStatement (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:12614:17)\n    at Parser.parseStatementContent (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:12298:21)\n    at Parser.parseStatement (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:12260:17)\n    at Parser.parseBlockOrModuleBlockBody (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:12846:25)\n    at Parser.parseBlockBody (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:12837:10)\n    at Parser.parseProgram (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:12191:10)\n    at Parser.parseTopLevel (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:12182:25)\n    at Parser.parse (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:13893:10)\n    at parse (/Users/ippeinakamura/Desktop/TaskLunner/backend/node_modules/@babel/parser/lib/index.js:13945:38)");

/***/ })

/******/ });
//# sourceMappingURL=index-afda4203c69779cbeafc.js.map