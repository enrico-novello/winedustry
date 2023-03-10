<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="entities.ordine.Pagamento"%>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" href="<%=request.getContextPath() %>/home/favicon.ico" type="image/x-icon">
    <title>Pagamento</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/inter-ui@3.11.0/inter.min.css"
    />
    <link rel="stylesheet" href="pagamento/pagamento.css" />
  </head>
  <body style="background: linear-gradient(109.6deg, rgba(0, 0, 0, 0.93) 11.2%, rgb(63, 61, 61) 78.9%);">
  <%Pagamento pag = (Pagamento)request.getAttribute("uPagamento"); %>
    <div class="wrapper" id="app">
      <div class="card-form">
        <div class="card-list">
          <div class="card-item" v-bind:class="{ '-active' : isCardFlipped }">
            <div class="card-item__side -front">
              <div
                class="card-item__focus"
                v-bind:class="{'-active' : focusElementStyle }"
                v-bind:style="focusElementStyle"
                ref="focusElement"
              ></div>
              <div class="card-item__cover">
                <img
                  v-bind:src="'https://raw.githubusercontent.com/muhammederdem/credit-card-form/master/src/assets/images/' + currentCardBackground + '.jpeg'"
                  class="card-item__bg"
                />
              </div>

              <div class="card-item__wrapper">
                <div class="card-item__top">
                  <img
                    src="https://raw.githubusercontent.com/muhammederdem/credit-card-form/master/src/assets/images/chip.png"
                    class="card-item__chip"
                  />
                  <div class="card-item__type">
                    <transition name="slide-fade-up">
                      <img
                        v-bind:src="'https://raw.githubusercontent.com/muhammederdem/credit-card-form/master/src/assets/images/' + getCardType + '.png'"
                        v-if="getCardType"
                        v-bind:key="getCardType"
                        alt=""
                        class="card-item__typeImg"
                      />
                    </transition>
                  </div>
                </div>
                <label
                  for="cardNumber"
                  class="card-item__number"
                  ref="cardNumber"
                >
                  <template v-if="getCardType === 'amex'">
                    <span v-for="(n, $index) in amexCardMask" :key="$index">
                      <transition name="slide-fade-up">
                        <div
                          class="card-item__numberItem"
                          v-if="$index > 4 && $index < 14 && cardNumber.length > $index && n.trim() !== ''"
                        >
                          *
                        </div>
                        <div
                          class="card-item__numberItem"
                          :class="{ '-active' : n.trim() === '' }"
                          :key="$index"
                          v-else-if="cardNumber.length > $index"
                        >
                          {{cardNumber[$index]}}
                        </div>
                        <div
                          class="card-item__numberItem"
                          :class="{ '-active' : n.trim() === '' }"
                          v-else
                          :key="$index + 1"
                        >
                          {{n}}
                        </div>
                      </transition>
                    </span>
                  </template>

                  <template v-else>
                    <span v-for="(n, $index) in otherCardMask" :key="$index">
                      <transition name="slide-fade-up">
                        <div
                          class="card-item__numberItem"
                          v-if="$index > 4 && $index < 15 && cardNumber.length > $index && n.trim() !== ''"
                        >
                          *
                        </div>
                        <div
                          class="card-item__numberItem"
                          :class="{ '-active' : n.trim() === '' }"
                          :key="$index"
                          v-else-if="cardNumber.length > $index"
                        >
                          {{cardNumber[$index]}}
                        </div>
                        <div
                          class="card-item__numberItem"
                          :class="{ '-active' : n.trim() === '' }"
                          v-else
                          :key="$index + 1"
                        >
                          {{n}}
                        </div>
                      </transition>
                    </span>
                  </template>
                </label>
                <div class="card-item__content">
                  <label for="cardName" class="card-item__info" ref="cardName">
                    <div class="card-item__holder">Intestatario Carta</div>
                    <transition name="slide-fade-up">
                      <div
                        class="card-item__name"
                        v-if="cardName.length"
                        key="1"
                      >
                        <transition-group name="slide-fade-right">
                          <span
                            class="card-item__nameItem"
                            v-for="(n, $index) in cardName.replace(/\s\s+/g, ' ')"
                            v-if="$index === $index"
                            v-bind:key="$index + 1"
                            >{{n}}</span
                          >
                        </transition-group>
                      </div>
                      <div class="card-item__name" v-else key="2">
                        Nome Cognome
                      </div>
                    </transition>
                  </label>
                  <div class="card-item__date" ref="cardDate">
                    <label for="cardMonth" class="card-item__dateTitle"
                      >Scadenza</label
                    >
                    <label for="cardMonth" class="card-item__dateItem">
                      <transition name="slide-fade-up">
                        <span v-if="cardMonth" v-bind:key="cardMonth"
                          >{{cardMonth}}</span
                        >
                        <span v-else key="2">MM</span>
                      </transition>
                    </label>
                    /
                    <label for="cardYear" class="card-item__dateItem">
                      <transition name="slide-fade-up">
                        <span v-if="cardYear" v-bind:key="cardYear"
                          >{{String(cardYear).slice(2,4)}}</span
                        >
                        <span v-else key="2">AA</span>
                      </transition>
                    </label>
                  </div>
                </div>
              </div>
            </div>
            <div class="card-item__side -back">
              <div class="card-item__cover">
                <img
                  v-bind:src="'https://raw.githubusercontent.com/muhammederdem/credit-card-form/master/src/assets/images/' + currentCardBackground + '.jpeg'"
                  class="card-item__bg"
                />
              </div>
              <div class="card-item__band"></div>
              <div class="card-item__cvv">
                <div class="card-item__cvvTitle">CVV</div>
                <div class="card-item__cvvBand">
                  <span v-for="(n, $index) in cardCvv" :key="$index"> * </span>
                </div>
                <div class="card-item__type">
                  <img
                    v-bind:src="'https://raw.githubusercontent.com/muhammederdem/credit-card-form/master/src/assets/images/' + getCardType + '.png'"
                    v-if="getCardType"
                    class="card-item__typeImg"
                  />
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- Input reali -->
        <div class="card-form__inner">
          <div class="card-input">
            <label for="cardNumber" class="card-input__label"
              >Numero Carta</label
            >
            <input
              type="text"
              id="cardNumber"
              class="card-input__input"
              v-mask="generateCardNumberMask"
              v-model="cardNumber"
              v-on:focus="focusInput"
              v-on:blur="blurInput"
              data-ref="cardNumber"
              autocomplete="off"
              name="numCarta"
              placeholder="<%=pag.getCarta()%>"
            />
          </div>
          <div class="card-input">
            <label for="cardName" class="card-input__label"
              >Intestatario Carta</label
            >
            <input
              type="text"
              id="cardName"
              class="card-input__input"
              v-model="cardName"
              v-on:focus="focusInput"
              v-on:blur="blurInput"
              data-ref="cardName"
              autocomplete="off"
              name="propCarta"
              placeholder="<%=pag.getProprietario()%>"
            />
          </div>
          <div class="card-form__row">
            <div class="card-form__col">
              <div class="card-form__group">
                <label for="cardMonth" class="card-input__label"
                  >Data Di Scadenza</label
                >
                <select
                  class="card-input__input -select"
                  id="cardMonth"
                  v-model="cardMonth"
                  v-on:focus="focusInput"
                  v-on:blur="blurInput"
                  data-ref="cardDate"
                >
                  <option placeholder="01" value="" disabled selected>01</option>
                  <option
                    v-bind:value="n < 10 ? '0' + n : n"
                    v-for="n in 12"
                    v-bind:disabled="n < minCardMonth"
                    v-bind:key="n"
                  >
                    {{n < 10 ? '0' + n : n}}
                  </option>
                </select>
                <select
                  class="card-input__input -select"
                  id="cardYear"
                  v-model="cardYear"
                  v-on:focus="focusInput"
                  v-on:blur="blurInput"
                  data-ref="cardDate"
                >
                  <option placeholder="01" value="" disabled selected>01</option>
                  <option
                    v-bind:value="$index + minCardYear"
                    v-for="(n, $index) in 12"
                    v-bind:key="n"
                  >
                    {{$index + minCardYear}}
                  </option>
                </select>
              </div>
            </div>
            <div class="card-form__col -cvv">
              <div class="card-input">
                <label for="cardCvv" class="card-input__label">CVV</label>
                <input
                  type="text"
                  class="card-input__input"
                  id="cardCvv"
                  v-mask="'####'"
                  maxlength="4"
                  v-model="cardCvv"
                  v-on:focus="flipCard(true)"
                  v-on:blur="flipCard(false)"
                  autocomplete="off"
                  name="cvvCarta"
              		placeholder="<%=pag.getCvv()%>"
                />
              </div>
            </div>
          </div>

          <div
            style="
              display: flex;
              justify-content: space-between;
              align-items: center;
              margin-top: 40px;
            "
          >
          <form action="./InserisciOrdineServlet" method="get">
            <button id="indietro" type="submit" class="bottoneIndietro" disabled="disabled" style="background-color: #C2CBF0; cursor: default;">Torna Indietro</button>
		</form>
           		<button class="truck-button" type="submit">
	              	<span class="default">Completa Ordine</span>
	              	<span class="success">
                	Ordine Completato
                	<svg viewbox="0 0 12 10">
                  	<polyline points="1.5 6 4.5 9 10.5 1"></polyline>
                	</svg>
	              	</span>
	              	<div class="truck">
		                <div class="wheel"></div>
		                <div class="back"></div>
		                <div class="front"></div>
		                <div class="box"></div>
	              	</div>
            	</button>
          </div>
        </div>
      </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.6.10/vue.min.js"></script>
    <script src="https://unpkg.com/vue-the-mask@0.11.1/dist/vue-the-mask.js"></script>
	<script src="pagamento/pagamento.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/gsap@3.0.1/dist/gsap.min.js"></script>
  </body>
</html>