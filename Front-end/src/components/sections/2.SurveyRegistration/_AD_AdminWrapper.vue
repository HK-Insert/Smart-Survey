<template>
  <div class="container section-space--inner--60">
    <div class="comment-wrapper">

      <h3>설문 등록 페이지</h3>
      <div class="comment-form">
        <div class="row">
          <div class="col-3 section-space--bottom--20 dropdown">
            <span class="title-admin-main"> 카테고리 </span>
            <span class="required"> *필수사항 </span>
            <input type="button" class="btn dropdown-toggle" id="dropdownMenu2" data-bs-toggle="dropdown"
              aria-expanded="false" :value="defaultselect" />
            <ul class="dropdown-menu" aria-labelledby="dropdownMenu2" style="width: 256px">
              <li>
                <a type="button" class="dropdown-item" v-for="(category, categoryIndex) in categoryList"
                  :key="categoryIndex" @click="setCategory(categoryIndex)">{{ categoryListkor[categoryIndex] }}</a>
              </li>
            </ul>
          </div>

          <!-- <div class="col-2 section-space--bottom--20 ">
                        <span class="title-admin-main"> 카테고리 </span>
                        <div>
                        <select id="category" v-model="surveyInfo.category">
                            <option
                                :value="categoryIndex"
                                :key="categoryIndex"
                                v-for="category, categoryIndex in categoryList">
                                {{category}}
                            </option>
                        </select>
                        </div>
                    </div> -->

          <div class="col-9 section-space--bottom--20">
            <span class="title-admin-main"> 제목 </span>
            <span class="required"> *필수사항 </span>
            <input type="text" v-model="surveyInfo.title" placeholder="설문 주제에 대한 제목을 입력하세요" />
          </div>

          <!-- <div class="col-7 section-space--bottom--20 ">
                        <span class="title-admin-main"> 제목 </span>
                        <span class="required"> *필수사항 </span>
                        <input type="text" v-model="surveyInfo.title">
                    </div>

                    <div class="col-2 section-space--bottom--20 ">
                        <span class="title-admin-main"> 이미지 </span>
                        <input type="text" v-model="surveyInfo.img">
                    </div> -->

          <div class="col-12 section-space--bottom--20">
            <span class="title-admin-main"> 설명 </span>
            <input type="text" v-model="surveyInfo.desc" placeholder="설문에 대한 상세 설명을 입력하세요" />
          </div>

          <div class="col-12 section-space--bottom--20">
            <span class="title-admin-main"> 외부 설문 URL </span>
            <span class="required"> *필수사항 </span>
            <input type="text" v-model="surveyInfo.url" placeholder="http://ko.surveymonkey.com/example/1" />
          </div>

          <div class="col-lg-4 col-sm-12 section-space--bottom--20">
            <span class="title-admin-main"> 보상금 </span>
            <span class="required"> *필수사항 </span>

            <div class="input-group">
              <input type="text" class="form-control" v-model="surveyInfo.reward" />
              <span class="input-group-text">Klay</span>
            </div>
          </div>

          <div class="col-lg-4 col-sm-12 section-space--bottom--20">
            <span class="title-admin-main"> 표본수 </span>
            <span class="required"> *필수사항 </span>

            <div class="input-group">
              <input type="number" class="form-control" min="1" v-model="surveyInfo.max" />
              <span class="input-group-text">명</span>
            </div>
          </div>

          <div class="col-lg-4 col-sm-12 section-space--bottom--20">
            <span class="title-admin-main"> 1인당 보상 지급액 </span>
            <span class="title-admin-sub">
              ( 보상 지급액 = 보상금 / 표본수 )
            </span>
            <div class="input-group">
              <input type="text" class="form-control" style="background: white" v-model="calcReward" readonly />
              <span class="input-group-text">Klay</span>
            </div>
          </div>

          <div class="col-lg-6 section-space--bottom--20">
       
            <span class="title-admin-main "> 시작일</span>
            <span class="required"> *필수사항 </span>
            <input type="text" class="calendar-position" v-model="startDay" @click="calendarSwitch(true)"/>
            <!-- 시작일자 달력 시작 -->
            <div v-if="startCalendar==true" class="calendar-float px-2 py-2">
              <b-calendar v-model="startDay"  locale="ko-KR"></b-calendar>
            </div>
            <!-- 시작일자 달력 종료 -->
          </div>

          <div class="col-lg-6 section-space--bottom--20">
            <span class="title-admin-main"> 종료일</span>
            <span class="required"> *필수사항 </span>
            <input type="text" class="calendar-position" v-model="endDay" @click="calendarSwitch(false)"/>
            <!-- 종료일자 달력 시작 -->
            <div v-if="endCalendar==true" class="calendar-float px-2 py-2">
              <b-calendar v-model="endDay"  locale="ko-KR"></b-calendar>
            </div>
            <!-- 종료일자 달력 종료 -->
          </div>

          <div class="col-lg-12">
            <span class="title-admin-main"> 참여 조건 설정</span>
            <!-- <span class="required"> *필수사항 </span> -->
            <table class="table table-hover">
              <thead align="center">
                <tr>
                  <th class="col-2">항목명</th>
                  <th class="col-8">상태</th>
                </tr>
              </thead>
              <tbody align="center">
                <tr @click="setAgreementState(tableIndex)" :key="tableIndex"
                  v-for="(privacyItem, tableIndex) in privacyList">
                  <th class="col-2">{{ privacyItem.description }}</th>
                  <td class="col-8">
                    <div class="row">
                      <div class="col-8">
                        <span v-if="privacyItem.state == 0" style="color: rgba(170, 170, 170, 0.658)">선택 없음
                        </span>
                        <span v-if="privacyItem.state == 1" style="color: #f0542d">필수 제공</span>
                        <!-- <span v-if="privacyItem.state == 2">선택적 제공</span> -->
                      </div>

                      <div class="col-4">
                        <!-- <input type="button" class="custom-btn" @click="setAgreementState(tableIndex)" value="변경"> -->
                        <label class="switch-button">
                          <input type="checkbox" v-bind:id="tableIndex" @click="setAgreementState(tableIndex)"
                            disabled />
                          <span class="onoff-switch"></span>
                        </label>
                      </div>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="col-12 d-flex justify-content-center">
            <input type="submit" value="등록하기" style="border-radius:5px" @click="addSurvey()" />
          </div>
        </div>
      </div>

    </div>
  </div>
</template>

<script>
  import Web3 from "web3";
  export default {
    components: {
    },
    data() {
      return {
        startCalendar: false,
        endCalendar: false,
        startDay: "시작일 선택",
        endDay: "종료일 선택",
        defaultselect: "선택",
        categoryListkor: ["여행", "자동차", "음악", "요리", "전자제품"],
        categoryList: ["travel", "car", "music", "food", "electronic-products"],
        surveyInfo: {
          category: 4,
          img: "",
          title: "",
          desc: "",
          sdate: 211121,
          edate: 221121,
          reward: 0,
          max: 1,
          vp: {},
          url: "",
        },
        privacyList: [{
            idx: 0,
            name: "birth",
            description: "생년월일",
            state: 0,
          },
          {
            idx: 1,
            name: "residence",
            description: "거주지",
            state: 0,
          },
          {
            idx: 2,
            name: "phonenumber",
            description: "핸드폰",
            state: 0,
          },
          {
            idx: 3,
            name: "income",
            description: "연봉",
            state: 0,
          },
          {
            idx: 4,
            name: "gender",
            description: "성별",
            state: 0,
          },
          {
            idx: 5,
            name: "age",
            description: "나이",
            state: 0,
          },
          {
            idx: 6,
            name: "edu",
            description: "학력",
            state: 0,
          },
          {
            idx: 7,
            name: "certificate",
            description: "자격증",
            state: 0,
          },
          {
            idx: 8,
            name: "carowner",
            description: "차량 보유 여부",
            state: 0,
          },
          {
            idx: 9,
            name: "email",
            description: "이메일",
            state: 0,
          },
        ],
      };
    },
    // 가짜 설문 생성툴
    // mounted(){
    //   this.surveyInfo.reward = String(Math.round(Math.random()*1000/3)/10000);
    //   this.surveyInfo.max = Math.round((Math.random()*100) + 1) * 10;
    // },
    methods: {
      setCategory(index) {
        this.surveyInfo.category = index;
        this.defaultselect = this.categoryListkor[index];
      },

      setAgreementState(index) {
        this.privacyList[index].state = (this.privacyList[index].state + 1) % 2;

        var vpObject = {};
        var iterableVP = this.privacyList
          .map(function (Obj) {
            if (Obj.state > 0) {
              var rObj = {};
              rObj[Obj.name] = Obj.state;
              return rObj;
            }
          })
          .filter((item) => item != undefined);

        // Object.assign(A, B) = JSON Object 형식 A, B를 하나로 합침  
        for (var vpItem of iterableVP) {
          vpObject = Object.assign(vpObject, vpItem);
        }

        this.surveyInfo.vp = vpObject;

        console.log(this.surveyInfo);

        var ele = document.getElementById(index);
        ele.checked = !ele.checked;

        this.$forceUpdate();
      },

      validateCheck() {
        var flag = true;

        if (this.defaultselect == "선택") {
          alert("카테고리를 선택해주세요.");
          flag = false;
        } else if (this.surveyInfo.title == "") {
          alert("제목을 선택해주세요.");
          flag = false;
        } else if (this.surveyInfo.url == "") {
          alert("설문지 URL을 입력해주세요.");
          flag = false;
        } else if (this.surveyInfo.reward <= 0) {
          alert("0 이상의 보상 지급액을 입력해주세요.");
          flag = false;
        } else if (this.surveyInfo.sdate < 211121 || this.surveyInfo.edate <= 211121) {
          alert("유효하지 않은 날짜 형식입니다. 다시 입력해주세요.");
          flag = false;
        }

        if (!flag) window.scrollTo(0, 180);

        return flag;
      },
      async addSurvey() {
        // 블록체인에 설문지 생성

        const web3 = new Web3(window.ethereum);

        var _account = (await web3.eth.getAccounts())[0];
        var _contractAddr = "0xd13D301B0AD89A576f2416D3Ba03173E489356eB";
        var _abi = {
          inputs: [{
              internalType: "address",
              name: "_owner",
              type: "address",
            },
            {
              internalType: "uint256",
              name: "_userLimit",
              type: "uint256",
            },
          ],
          name: "createSurvey",
          outputs: [],
          stateMutability: "payable",
          type: "function",
        };

        var _params = [_account, this.surveyInfo.max];
        var _data = web3.eth.abi.encodeFunctionCall(_abi, _params);

        await web3.eth.sendTransaction({
          from: _account,
          to: _contractAddr,
          value: web3.utils.toWei(String(this.surveyInfo.reward), "ether"),
          data: _data,
        });

        // DB에 설문지 생성
        // 설문 데이터 입력 여부 및 유효성 검증
        this.surveyInfo.sdate = parseInt(this.startDay.replaceAll('-','').substring(2,7))
        this.surveyInfo.edate = parseInt(this.endDay.replaceAll('-','').substring(2,7))

        // 유효성 검사 부분
        // if (!this.validateCheck()) return 0;

        console.log("POST", this.surveyInfo);
        
        this.surveyInfo.vp = JSON.stringify(this.surveyInfo.vp)

        var data = [
          this.surveyInfo.category,
          this.surveyInfo.img,
          this.surveyInfo.title,
          this.surveyInfo.desc,
          this.surveyInfo.sdate,
          this.surveyInfo.edate,
          this.surveyInfo.max,
          this.surveyInfo.reward,
          this.surveyInfo.vp,
          this.surveyInfo.url
        ]

        this.$api("POST", "http://127.0.0.1:3000/api/survey", data);

        alert("설문이 생성되었습니다.");
        location.reload();
      },
      // 달력 온 오프
      calendarSwitch(i) {
        if (i == true) {
          if (this.startCalendar == false) {
            return this.startCalendar = true
          } else {
            return this.startCalendar = false
          }
        } else {
           if (this.endCalendar == false) {
           return this.endCalendar = true
          } else {
           return this.endCalendar = false
          }
        }
      }
    },
    computed: {
      calcReward() {
        if (this.surveyInfo.reward == 0 || this.surveyInfo.max == 0) {
          return 0;
        }
        return this.surveyInfo.reward / this.surveyInfo.max;
      },
    },
  };
</script>
<style scoped>
  .switch-button {
    position: relative;
    display: inline-block;
    width: 55px;
    height: 30px;
  }

  .switch-button input {
    opacity: 0;
    width: 0;
    height: 0;
  }

  .onoff-switch {
    position: absolute;
    cursor: pointer;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    border-radius: 20px;
    background-color: #ccc;
    box-shadow: inset 1px 5px 1px #999;
    -webkit-transition: 0.2s;
    transition: 0.2s;
  }

  .onoff-switch:before {
    position: absolute;
    content: "";
    height: 22px;
    width: 22px;
    left: 4px;
    bottom: 4px;
    background-color: #fff;
    -webkit-transition: 0.2s;
    transition: 0.2s;
    border-radius: 20px;
  }

  .switch-button input:checked+.onoff-switch {
    background-color: #f0542d;
    box-shadow: inset 1px 5px 1px #f0542d;
  }

  .switch-button input:checked+.onoff-switch:before {
    -webkit-transform: translateX(26px);
    -ms-transform: translateX(26px);
    transform: translateX(26px);
  }
</style>

<style lang="scss" scoped>
  .custom-btn {
    height: 100%;
    width: 90px;
    font-weight: bold;
    border-radius: 22px;
    border: 1px solid #ced4da;
    color: #495057;
  }

  span {
    font-weight: bold;
  }

  td,
  th,
  tr {
    height: 10px;
  }

  .required {
    padding-left: 3px;
    font-size: 6px;
    color: red;
    letter-spacing: -0.05rem;
  }

  .title {
    &-admin {
      &-main {
        font-weight: bold;
      }

      &-sub {
        font-size: 10px;
        letter-spacing: -0.05rem;
      }
    }
  }

  .dropdown-menu {
    z-index: 2 !important;
  }

  .calendar-position {
    position: relative;
  }

  .calendar-float {
    position: absolute;
    z-index: 3;
    background-color: #00000079;
  }
</style>