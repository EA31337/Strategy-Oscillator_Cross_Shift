/**
 * @file
 * Implements Oscillator Cross Shift strategy
 * based on selected oscillator-type indicators with shift crossable logic.
 */

// Enums.

enum ENUM_STG_OSCILLATOR_CROSS_SHIFT_TYPE {
  STG_OSCILLATOR_CROSS_SHIFT_TYPE_0_NONE = 0,  // (None)
  STG_OSCILLATOR_TYPE_AC,                      // AC: Accelerator/Decelerator
  STG_OSCILLATOR_TYPE_AD,                      // AD: Accumulation/Distribution
  STG_OSCILLATOR_TYPE_AO,                      // AO: Awesome
  STG_OSCILLATOR_TYPE_ATR,                     // ATR
  STG_OSCILLATOR_TYPE_BEARS,                   // Bears Power
  STG_OSCILLATOR_TYPE_BULLS,                   // Bulls Power
  STG_OSCILLATOR_TYPE_BWMFI,                   // BWMFI
  STG_OSCILLATOR_TYPE_CCI,                     // CCI
  STG_OSCILLATOR_TYPE_CHO,                     // CHO: Chaikin
  STG_OSCILLATOR_TYPE_CHV,                     // CHV: Chaikin Volatility
  STG_OSCILLATOR_TYPE_DEMARKER,                // DeMarker
  STG_OSCILLATOR_TYPE_MFI,                     // MFI
  STG_OSCILLATOR_TYPE_MOM,                     // MOM: Momentum
  STG_OSCILLATOR_TYPE_OBV,                     // OBV: On Balance Volume
  STG_OSCILLATOR_TYPE_PVT,                     // PVT: Price and Volume Trend
  STG_OSCILLATOR_TYPE_ROC,                     // ROC: Rate of Change
  STG_OSCILLATOR_TYPE_RSI,                     // RSI
  STG_OSCILLATOR_TYPE_STDDEV,                  // StdDev: Standard Deviation
  STG_OSCILLATOR_TYPE_STOCH,                   // Stochastic
  STG_OSCILLATOR_TYPE_TRIX,                    // TRIX: Triple Exponential Average
  STG_OSCILLATOR_TYPE_UO,                      // UO: Ultimate Oscillator
  STG_OSCILLATOR_TYPE_WAD,                     // WAD: Larry Williams' Accumulation/Distribution
  STG_OSCILLATOR_TYPE_WPR,                     // WPR
  STG_OSCILLATOR_TYPE_VOL,                     // VOL: Volumes
  // STG_OSCILLATOR_CROSS_SHIFT_TYPE_ADX,         // ADX
  // STG_OSCILLATOR_CROSS_SHIFT_TYPE_ADXW,        // ADXW
  // STG_OSCILLATOR_CROSS_SHIFT_TYPE_MACD,        // MACD
  // STG_OSCILLATOR_CROSS_SHIFT_TYPE_RVI,         // RVI: Relative Vigor Index
};

// User input params.
INPUT_GROUP("Oscillator Cross_Shift strategy: main strategy params");
INPUT ENUM_STG_OSCILLATOR_CROSS_SHIFT_TYPE Oscillator_Cross_Shift_Type =
    STG_OSCILLATOR_CROSS_SHIFT_TYPE_0_NONE;  // Oscillator type
INPUT_GROUP("Oscillator Cross_Shift strategy: strategy params");
INPUT float Oscillator_Cross_Shift_LotSize = 0;                // Lot size
INPUT int Oscillator_Cross_Shift_SignalOpenMethod = 2;         // Signal open method
INPUT float Oscillator_Cross_Shift_SignalOpenLevel = 10.0f;    // Signal open level
INPUT int Oscillator_Cross_Shift_SignalOpenFilterMethod = 32;  // Signal open filter method
INPUT int Oscillator_Cross_Shift_SignalOpenFilterTime = 3;     // Signal open filter time (0-31)
INPUT int Oscillator_Cross_Shift_SignalOpenBoostMethod = 0;    // Signal open boost method
INPUT int Oscillator_Cross_Shift_SignalCloseMethod = 0;        // Signal close method
INPUT int Oscillator_Cross_Shift_SignalCloseFilter = 32;       // Signal close filter (-127-127)
INPUT float Oscillator_Cross_Shift_SignalCloseLevel = 10.0f;   // Signal close level
INPUT int Oscillator_Cross_Shift_PriceStopMethod = 0;          // Price limit method
INPUT float Oscillator_Cross_Shift_PriceStopLevel = 2;         // Price limit level
INPUT int Oscillator_Cross_Shift_TickFilterMethod = 32;        // Tick filter method (0-255)
INPUT float Oscillator_Cross_Shift_MaxSpread = 4.0;            // Max spread to trade (in pips)
INPUT short Oscillator_Cross_Shift = 0;                        // Shift
INPUT float Oscillator_Cross_Shift_OrderCloseLoss = 80;        // Order close loss
INPUT float Oscillator_Cross_Shift_OrderCloseProfit = 80;      // Order close profit
INPUT int Oscillator_Cross_Shift_OrderCloseTime = -30;         // Order close time in mins (>0) or bars (<0)

INPUT_GROUP("Oscillator strategy: AC oscillator params");
INPUT int Oscillator_Indi_AC_Shift = 0;                                      // Shift
INPUT int Oscillator_Indi_AC_Shift2 = 0;                                     // Shift 2
INPUT ENUM_IDATA_SOURCE_TYPE Oscillator_Indi_AC_SourceType = IDATA_BUILTIN;  // Source type
INPUT_GROUP("Oscillator strategy: AD oscillator params");
INPUT int Oscillator_Indi_AD_Shift = 0;                                      // Shift
INPUT int Oscillator_Indi_AD_Shift2 = 0;                                     // Shift 2
INPUT ENUM_IDATA_SOURCE_TYPE Oscillator_Indi_AD_SourceType = IDATA_BUILTIN;  // Source type
INPUT_GROUP("Oscillator strategy: ATR oscillator params");
INPUT int Oscillator_Indi_ATR_Period = 13;  // Period
INPUT int Oscillator_Indi_ATR_Shift = 0;    // Shift
INPUT int Oscillator_Indi_ATR_Shift2 = 0;   // Shift 2
INPUT_GROUP("Oscillator strategy: Awesome oscillator params");
INPUT int Oscillator_Indi_Awesome_Shift = 0;   // Shift
INPUT int Oscillator_Indi_Awesome_Shift2 = 0;  // Shift 2
INPUT_GROUP("Oscillator strategy: BearsPower oscillator params");
INPUT int Oscillator_Indi_BearsPower_Period = 30;                                 // Period
INPUT ENUM_APPLIED_PRICE Oscillator_Indi_BearsPower_Applied_Price = PRICE_CLOSE;  // Applied Price
INPUT int Oscillator_Indi_BearsPower_Shift = 0;                                   // Shift
INPUT int Oscillator_Indi_BearsPower_Shift2 = 0;                                  // Shift 2
INPUT_GROUP("Oscillator strategy: BullsPower oscillator params");
INPUT int Oscillator_Indi_BullsPower_Period = 30;                                 // Period
INPUT ENUM_APPLIED_PRICE Oscillator_Indi_BullsPower_Applied_Price = PRICE_CLOSE;  // Applied Price
INPUT int Oscillator_Indi_BullsPower_Shift = 0;                                   // Shift
INPUT int Oscillator_Indi_BullsPower_Shift2 = 0;                                  // Shift 2
INPUT_GROUP("Oscillator strategy: BWMFI oscillator params");
INPUT int Oscillator_Indi_BWMFI_Shift = 1;                                      // Shift
INPUT int Oscillator_Indi_BWMFI_Shift2 = 1;                                     // Shift 2
INPUT ENUM_IDATA_SOURCE_TYPE Oscillator_Indi_BWMFI_SourceType = IDATA_BUILTIN;  // Source type
INPUT_GROUP("Oscillator strategy: CCI oscillator params");
INPUT int Oscillator_Indi_CCI_Period = 20;                                   // Period
INPUT ENUM_APPLIED_PRICE Oscillator_Indi_CCI_Applied_Price = PRICE_TYPICAL;  // Applied Price
INPUT int Oscillator_Indi_CCI_Shift = 0;                                     // Shift
INPUT int Oscillator_Indi_CCI_Shift2 = 0;                                    // Shift 2
INPUT_GROUP("Oscillator strategy: Chaikin oscillator params");
INPUT int Oscillator_Indi_CHO_InpFastMA = 10;                                 // Fast EMA period
INPUT int Oscillator_Indi_CHO_InpSlowMA = 30;                                 // Slow MA period
INPUT ENUM_MA_METHOD Oscillator_Indi_CHO_InpSmoothMethod = MODE_SMMA;         // MA method
INPUT ENUM_APPLIED_VOLUME Oscillator_Indi_CHO_InpVolumeType = VOLUME_TICK;    // Volumes
INPUT int Oscillator_Indi_CHO_Shift = 0;                                      // Shift
INPUT int Oscillator_Indi_CHO_Shift2 = 0;                                     // Shift 2
INPUT ENUM_IDATA_SOURCE_TYPE Oscillator_Indi_CHO_SourceType = IDATA_BUILTIN;  // Source type
INPUT_GROUP("Oscillator strategy: Chaikin Volatility oscillator params");
INPUT unsigned int Oscillator_Indi_CHV_Smooth_Period;                         // Smooth period
INPUT unsigned int Oscillator_Indi_CHV_Period;                                // Period
INPUT ENUM_CHV_SMOOTH_METHOD Oscillator_Indi_CHV_Smooth_Method;               // Smooth method
INPUT int Oscillator_Indi_CHV_Shift = 0;                                      // Shift
INPUT int Oscillator_Indi_CHV_Shift2 = 0;                                     // Shift 2
INPUT ENUM_IDATA_SOURCE_TYPE Oscillator_Indi_CHV_SourceType = IDATA_BUILTIN;  // Source type
INPUT_GROUP("Oscillator strategy: DeMarker indicator params");
INPUT int Oscillator_Indi_DeMarker_Period = 23;                                    // Period
INPUT int Oscillator_Indi_DeMarker_Shift = 0;                                      // Shift
INPUT int Oscillator_Indi_DeMarker_Shift2 = 0;                                     // Shift 2
INPUT ENUM_IDATA_SOURCE_TYPE Oscillator_Indi_DeMarker_SourceType = IDATA_BUILTIN;  // Source type
INPUT_GROUP("Oscillator strategy: MFI oscillator params");
INPUT int Oscillator_Indi_MFI_MA_Period = 22;                                           // MA Period
INPUT ENUM_APPLIED_VOLUME Oscillator_Indi_MFI_Applied_Volume = (ENUM_APPLIED_VOLUME)0;  // Applied volume.
INPUT int Oscillator_Indi_MFI_Shift = 0;                                                // Shift
INPUT int Oscillator_Indi_MFI_Shift2 = 0;                                               // Shift 2
INPUT ENUM_IDATA_SOURCE_TYPE Oscillator_Indi_MFI_SourceType = IDATA_BUILTIN;            // Source type
INPUT_GROUP("Oscillator strategy: Momentum oscillator params");
INPUT int Oscillator_Indi_Momentum_Period = 12;                                    // Averaging period
INPUT ENUM_APPLIED_PRICE Oscillator_Indi_Momentum_Applied_Price = PRICE_CLOSE;     // Applied Price
INPUT int Oscillator_Indi_Momentum_Shift = 0;                                      // Shift
INPUT int Oscillator_Indi_Momentum_Shift2 = 0;                                     // Shift 2
INPUT ENUM_IDATA_SOURCE_TYPE Oscillator_Indi_Momentum_SourceType = IDATA_BUILTIN;  // Source type
INPUT_GROUP("Oscillator strategy: OBV oscillator params");
INPUT ENUM_APPLIED_PRICE Oscillator_Indi_OBV_Applied_Price = PRICE_CLOSE;     // Applied Price
INPUT int Oscillator_Indi_OBV_Shift = 1;                                      // Shift
INPUT int Oscillator_Indi_OBV_Shift2 = 1;                                     // Shift 2
INPUT ENUM_IDATA_SOURCE_TYPE Oscillator_Indi_OBV_SourceType = IDATA_BUILTIN;  // Source type
INPUT_GROUP("Oscillator strategy: PVT oscillator params");
INPUT ENUM_APPLIED_VOLUME Oscillator_Indi_PVT_InpVolumeType = VOLUME_TICK;    // Volumes
INPUT int Oscillator_Indi_PVT_Shift = 0;                                      // Shift
INPUT int Oscillator_Indi_PVT_Shift2 = 0;                                     // Shift 2
INPUT ENUM_IDATA_SOURCE_TYPE Oscillator_Indi_PVT_SourceType = IDATA_BUILTIN;  // Source type
INPUT_GROUP("Oscillator strategy: ROC oscillator params");
INPUT int Oscillator_Indi_ROC_Period = 16;                                    // Period
INPUT ENUM_APPLIED_PRICE Oscillator_Indi_ROC_Applied_Price = PRICE_WEIGHTED;  // Applied Price
INPUT int Oscillator_Indi_ROC_Shift = 0;                                      // Shift
INPUT int Oscillator_Indi_ROC_Shift2 = 0;                                     // Shift 2
INPUT ENUM_IDATA_SOURCE_TYPE Oscillator_Indi_ROC_SourceType = IDATA_BUILTIN;  // Source type
INPUT_GROUP("Oscillator strategy: RSI oscillator params");
INPUT int Oscillator_Indi_RSI_Period = 16;                                    // Period
INPUT ENUM_APPLIED_PRICE Oscillator_Indi_RSI_Applied_Price = PRICE_WEIGHTED;  // Applied Price
INPUT int Oscillator_Indi_RSI_Shift = 0;                                      // Shift
INPUT int Oscillator_Indi_RSI_Shift2 = 0;                                     // Shift 2
INPUT_GROUP("Oscillator strategy: StdDev oscillator params");
INPUT int Oscillator_Indi_StdDev_MA_Period = 24;                                 // Period
INPUT int Oscillator_Indi_StdDev_MA_Shift = 0;                                   // MA Shift
INPUT ENUM_MA_METHOD Oscillator_Indi_StdDev_MA_Method = (ENUM_MA_METHOD)3;       // MA Method
INPUT ENUM_APPLIED_PRICE Oscillator_Indi_StdDev_Applied_Price = PRICE_WEIGHTED;  // Applied Price
INPUT int Oscillator_Indi_StdDev_Shift = 0;                                      // Shift
INPUT int Oscillator_Indi_StdDev_Shift2 = 0;                                     // Shift 2
INPUT ENUM_IDATA_SOURCE_TYPE Oscillator_Indi_StdDev_SourceType = IDATA_BUILTIN;  // Source type
INPUT_GROUP("Oscillator strategy: Stochastic oscillator params");
INPUT int Oscillator_Indi_Stochastic_KPeriod = 8;                      // K line period
INPUT int Oscillator_Indi_Stochastic_DPeriod = 12;                     // D line period
INPUT int Oscillator_Indi_Stochastic_Slowing = 12;                     // Slowing
INPUT ENUM_MA_METHOD Oscillator_Indi_Stochastic_MA_Method = MODE_EMA;  // Moving Average method
INPUT ENUM_STO_PRICE Oscillator_Indi_Stochastic_Price_Field = 0;       // Price (0 - Low/High or 1 - Close/Close)
INPUT int Oscillator_Indi_Stochastic_Shift = 0;                        // Shift
INPUT int Oscillator_Indi_Stochastic_Shift2 = 0;                       // Shift 2
INPUT_GROUP("Oscillator strategy: TRIX oscillator params");
INPUT int Oscillator_Indi_TRIX_InpPeriodEMA = 14;                              // EMA period
INPUT ENUM_APPLIED_PRICE Oscillator_Indi_TRIX_Applied_Price = PRICE_WEIGHTED;  // Applied Price
INPUT int Oscillator_Indi_TRIX_Shift = 0;                                      // Shift
INPUT int Oscillator_Indi_TRIX_Shift2 = 0;                                     // Shift 2
INPUT ENUM_IDATA_SOURCE_TYPE Oscillator_Indi_TRIX_SourceType = IDATA_BUILTIN;  // Source type
INPUT_GROUP("Oscillator strategy: Ultimate oscillator params");
INPUT int Oscillator_Indi_UO_InpFastPeriod = 7;                              // Fast ATR period
INPUT int Oscillator_Indi_UO_InpMiddlePeriod = 14;                           // Middle ATR period
INPUT int Oscillator_Indi_UO_InpSlowPeriod = 28;                             // Slow ATR period
INPUT int Oscillator_Indi_UO_InpFastK = 4;                                   // Fast K
INPUT int Oscillator_Indi_UO_InpMiddleK = 2;                                 // Middle K
INPUT int Oscillator_Indi_UO_InpSlowK = 1;                                   // Slow K
INPUT int Oscillator_Indi_UO_Shift = 0;                                      // Shift
INPUT int Oscillator_Indi_UO_Shift2 = 0;                                     // Shift 2
INPUT ENUM_IDATA_SOURCE_TYPE Oscillator_Indi_UO_SourceType = IDATA_BUILTIN;  // Source type
INPUT_GROUP("Oscillator strategy: Williams' Accumulation/Distribution oscillator params");
INPUT int Oscillator_Indi_WAD_Shift = 0;                                      // Shift
INPUT ENUM_IDATA_SOURCE_TYPE Oscillator_Indi_WAD_SourceType = IDATA_BUILTIN;  // Source type
INPUT_GROUP("Oscillator strategy: WPR oscillator params");
INPUT int Oscillator_Indi_WPR_Period = 18;  // Period
INPUT int Oscillator_Indi_WPR_Shift = 0;    // Shift
INPUT int Oscillator_Indi_WPR_Shift2 = 0;   // Shift 2
INPUT_GROUP("Oscillator strategy: Volumes oscillator params");
INPUT ENUM_APPLIED_VOLUME Oscillator_Indi_VOL_InpVolumeType = VOLUME_TICK;    // Volumes
INPUT int Oscillator_Indi_VOL_Shift = 0;                                      // Shift
INPUT int Oscillator_Indi_VOL_Shift2 = 0;                                     // Shift 2
INPUT ENUM_IDATA_SOURCE_TYPE Oscillator_Indi_VOL_SourceType = IDATA_BUILTIN;  // Source type

/* @todo
INPUT_GROUP("Oscillator Cross_Shift strategy: ADX indicator params");
INPUT ENUM_INDI_ADX_LINE Oscillator_Cross_Shift_Indi_ADX_Fast_Line = LINE_PLUSDI;         // Fast line
INPUT ENUM_INDI_ADX_LINE Oscillator_Cross_Shift_Indi_ADX_Slow_Line = LINE_MINUSDI;        // Slow line to cross_shift
INPUT int Oscillator_Cross_Shift_Indi_ADX_Period = 16;                                    // Averaging period
INPUT ENUM_APPLIED_PRICE Oscillator_Cross_Shift_Indi_ADX_AppliedPrice = PRICE_TYPICAL;    // Applied price
INPUT int Oscillator_Cross_Shift_Indi_ADX_Shift = 0;                                      // Shift
INPUT ENUM_IDATA_SOURCE_TYPE Oscillator_Cross_Shift_Indi_ADX_SourceType = IDATA_BUILTIN;  // Source type
INPUT_GROUP("Oscillator Cross_Shift strategy: ADXW indicator params");
INPUT ENUM_INDI_ADX_LINE Oscillator_Cross_Shift_Indi_ADXW_Fast_Line = LINE_PLUSDI;         // Fast line
INPUT ENUM_INDI_ADX_LINE Oscillator_Cross_Shift_Indi_ADXW_Slow_Line = LINE_MINUSDI;        // Slow line to cross_shift
INPUT int Oscillator_Cross_Shift_Indi_ADXW_Period = 16;                                    // Averaging period
INPUT ENUM_APPLIED_PRICE Oscillator_Cross_Shift_Indi_ADXW_AppliedPrice = PRICE_TYPICAL;    // Applied price
INPUT int Oscillator_Cross_Shift_Indi_ADXW_Shift = 0;                                      // Shift
INPUT ENUM_IDATA_SOURCE_TYPE Oscillator_Cross_Shift_Indi_ADXW_SourceType = IDATA_BUILTIN;  // Source type
INPUT_GROUP("Oscillator strategy: MACD indicator params");
INPUT ENUM_SIGNAL_LINE Oscillator_Cross_Shift_Indi_MACD_Fast_Line = LINE_SIGNAL;  // Fast line
INPUT ENUM_SIGNAL_LINE Oscillator_Cross_Shift_Indi_MACD_Slow_Line = LINE_MAIN;    // Slow line
INPUT int Oscillator_Indi_MACD_Period_Fast = 6;                                   // Period Fast
INPUT int Oscillator_Indi_MACD_Period_Slow = 34;                                  // Period Slow
INPUT int Oscillator_Indi_MACD_Period_Signal = 10;                                // Period Signal
INPUT ENUM_APPLIED_PRICE Oscillator_Indi_MACD_Applied_Price = PRICE_OPEN;         // Applied Price
INPUT int Oscillator_Indi_MACD_Shift = 0;                                         // Shift
INPUT_GROUP("Oscillator strategy: RVI indicator params");
INPUT ENUM_SIGNAL_LINE Oscillator_Cross_Shift_Indi_RVI_Fast_Line = LINE_SIGNAL;           // Fast line
INPUT ENUM_SIGNAL_LINE Oscillator_Cross_Shift_Indi_RVI_Slow_Line = LINE_MAIN;             // Slow line
INPUT unsigned int Oscillator_Indi_RVI_Period = 12;                                       // Averaging period
INPUT int Oscillator_Indi_RVI_Shift = 0;                                                  // Shift
INPUT ENUM_IDATA_SOURCE_TYPE Oscillator_Cross_Shift_Indi_RVI_SourceType = IDATA_BUILTIN;  // Source type
*/

// Structs.

// Defines struct with default user strategy values.
struct Stg_Oscillator_Cross_Shift_Params_Defaults : StgParams {
  uint line_fast, line_slow;
  Stg_Oscillator_Cross_Shift_Params_Defaults()
      : StgParams(::Oscillator_Cross_Shift_SignalOpenMethod, ::Oscillator_Cross_Shift_SignalOpenFilterMethod,
                  ::Oscillator_Cross_Shift_SignalOpenLevel, ::Oscillator_Cross_Shift_SignalOpenBoostMethod,
                  ::Oscillator_Cross_Shift_SignalCloseMethod, ::Oscillator_Cross_Shift_SignalCloseFilter,
                  ::Oscillator_Cross_Shift_SignalCloseLevel, ::Oscillator_Cross_Shift_PriceStopMethod,
                  ::Oscillator_Cross_Shift_PriceStopLevel, ::Oscillator_Cross_Shift_TickFilterMethod,
                  ::Oscillator_Cross_Shift_MaxSpread, ::Oscillator_Cross_Shift),
        line_fast(0),
        line_slow(0) {
    Set(STRAT_PARAM_LS, Oscillator_Cross_Shift_LotSize);
    Set(STRAT_PARAM_OCL, Oscillator_Cross_Shift_OrderCloseLoss);
    Set(STRAT_PARAM_OCP, Oscillator_Cross_Shift_OrderCloseProfit);
    Set(STRAT_PARAM_OCT, Oscillator_Cross_Shift_OrderCloseTime);
    Set(STRAT_PARAM_SOFT, Oscillator_Cross_Shift_SignalOpenFilterTime);
  }
  // Getters.
  uint GetLineFast() { return line_fast; }
  uint GetLineSlow() { return line_slow; }
  // Setters.
  void SetLineFast(uint _value) { line_fast = _value; }
  void SetLineSlow(uint _value) { line_slow = _value; }
};

class Stg_Oscillator_Cross_Shift : public Strategy {
 protected:
  Stg_Oscillator_Cross_Shift_Params_Defaults ssparams;

 public:
  Stg_Oscillator_Cross_Shift(StgParams &_sparams, TradeParams &_tparams, ChartParams &_cparams, string _name = "")
      : Strategy(_sparams, _tparams, _cparams, _name) {}

  static Stg_Oscillator_Cross_Shift *Init(ENUM_TIMEFRAMES _tf = NULL, EA *_ea = NULL) {
    // Initialize strategy initial values.
    Stg_Oscillator_Cross_Shift_Params_Defaults stg_oscillator_cross_shift_defaults;
    StgParams _stg_params(stg_oscillator_cross_shift_defaults);
    // Initialize Strategy instance.
    ChartParams _cparams(_tf, _Symbol);
    TradeParams _tparams;
    Stg_Oscillator_Cross_Shift *_strat =
        new Stg_Oscillator_Cross_Shift(_stg_params, _tparams, _cparams, "Oscillator_Cross_Shift");
    _strat.ssparams = stg_oscillator_cross_shift_defaults;
    return _strat;
  }

  /**
   * Validate oscillator's entry.
   */
  bool IsValidEntry(IndicatorBase *_indi, int _shift = 0) {
    bool _result = true;
    switch (Oscillator_Cross_Shift_Type) {
        /* @todo
              case STG_OSCILLATOR_CROSS_SHIFT_TYPE_ADX:
                _result &= dynamic_cast<Indi_ADX *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift) &&
                           dynamic_cast<Indi_ADX *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift + 1);
                break;
              case STG_OSCILLATOR_CROSS_SHIFT_TYPE_ADXW:
                _result &= dynamic_cast<Indi_ADXW *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift) &&
                           dynamic_cast<Indi_ADXW *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift + 1);
                break;
              case STG_OSCILLATOR_CROSS_SHIFT_TYPE_MACD:
                _result &= dynamic_cast<Indi_MACD *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift) &&
                           dynamic_cast<Indi_MACD *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift + 1);
                break;
              case STG_OSCILLATOR_CROSS_SHIFT_TYPE_RVI:
                _result &= dynamic_cast<Indi_RVI *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift) &&
                           dynamic_cast<Indi_RVI *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift + 1);
                break;
        */
      default:
        break;
    }
    return _result;
  }

  /**
   * Event on strategy's init.
   */
  void OnInit() {
    // Initialize indicators.
    switch (Oscillator_Cross_Shift_Type) {
        /* @todo: Convert multi into single mode.
              case STG_OSCILLATOR_CROSS_SHIFT_TYPE_ADX:  // ADX
              {
                IndiADXParams _adx_params(::Oscillator_Cross_Shift_Indi_ADX_Period,
                                          ::Oscillator_Cross_Shift_Indi_ADX_AppliedPrice,
                                          ::Oscillator_Cross_Shift_Indi_ADX_Shift);
                _adx_params.SetDataSourceType(::Oscillator_Cross_Shift_Indi_ADX_SourceType);
                _adx_params.SetTf(Get<ENUM_TIMEFRAMES>(STRAT_PARAM_TF));
                SetIndicator(new Indi_ADX(_adx_params), ::Oscillator_Cross_Shift_Type);
                // sparams.SetLineFast(0); // @todo: Fix Strategy to allow custom params stored in sparam.
                ssparams.SetLineFast((uint)Oscillator_Cross_Shift_Indi_ADX_Fast_Line);
                ssparams.SetLineSlow((uint)Oscillator_Cross_Shift_Indi_ADX_Slow_Line);
                break;
              }
              case STG_OSCILLATOR_CROSS_SHIFT_TYPE_ADXW:  // ADXW
              {
                IndiADXWParams _adxw_params(::Oscillator_Cross_Shift_Indi_ADXW_Period,
                                            ::Oscillator_Cross_Shift_Indi_ADXW_AppliedPrice,
                                            ::Oscillator_Cross_Shift_Indi_ADXW_Shift);
                _adxw_params.SetDataSourceType(::Oscillator_Cross_Shift_Indi_ADXW_SourceType);
                _adxw_params.SetTf(Get<ENUM_TIMEFRAMES>(STRAT_PARAM_TF));
                SetIndicator(new Indi_ADXW(_adxw_params), ::Oscillator_Cross_Shift_Type);
                // sparams.SetLineFast(0); // @todo: Fix Strategy to allow custom params stored in sparam.
                ssparams.SetLineFast((uint)Oscillator_Cross_Shift_Indi_ADXW_Fast_Line);
                ssparams.SetLineSlow((uint)Oscillator_Cross_Shift_Indi_ADXW_Slow_Line);
                break;
              }
              case STG_OSCILLATOR_CROSS_SHIFT_TYPE_MACD:  // MACD
              {
                IndiMACDParams _indi_params(::Oscillator_Indi_MACD_Period_Fast, ::Oscillator_Indi_MACD_Period_Slow,
                                            ::Oscillator_Indi_MACD_Period_Signal, ::Oscillator_Indi_MACD_Applied_Price,
                                            ::Oscillator_Indi_MACD_Shift);
                _indi_params.SetTf(Get<ENUM_TIMEFRAMES>(STRAT_PARAM_TF));
                SetIndicator(new Indi_MACD(_indi_params), ::Oscillator_Cross_Shift_Type);
                ssparams.SetLineFast((uint)Oscillator_Cross_Shift_Indi_MACD_Fast_Line);
                ssparams.SetLineSlow((uint)Oscillator_Cross_Shift_Indi_MACD_Slow_Line);
                break;
              }
              case STG_OSCILLATOR_CROSS_SHIFT_TYPE_RVI:  // RVI
              {
                IndiRVIParams _indi_params(::Oscillator_Indi_RVI_Period, ::Oscillator_Indi_RVI_Shift);
                _indi_params.SetDataSourceType(::Oscillator_Cross_Shift_Indi_RVI_SourceType);
                _indi_params.SetTf(Get<ENUM_TIMEFRAMES>(STRAT_PARAM_TF));
                SetIndicator(new Indi_RVI(_indi_params), ::Oscillator_Cross_Shift_Type);
                ssparams.SetLineFast((uint)Oscillator_Cross_Shift_Indi_RVI_Fast_Line);
                ssparams.SetLineSlow((uint)Oscillator_Cross_Shift_Indi_RVI_Slow_Line);
                break;
              }
        */
      case STG_OSCILLATOR_CROSS_SHIFT_TYPE_0_NONE:  // (None)
      default:
        break;
    }
  }

  /**
   * Check strategy's opening signal.
   */
  bool SignalOpen(ENUM_ORDER_TYPE _cmd, int _method, float _level = 0.0f, int _shift = 0) {
    IndicatorBase *_indi = GetIndicator(::Oscillator_Cross_Shift_Type);
    // uint _ishift = _indi.GetShift(); // @todo
    bool _result = Oscillator_Cross_Shift_Type != STG_OSCILLATOR_CROSS_SHIFT_TYPE_0_NONE && IsValidEntry(_indi, _shift);
    if (!_result) {
      // Returns false when indicator data is not valid.
      return false;
    }
    int _line_fast = (int)ssparams.GetLineFast();
    int _line_slow = (int)ssparams.GetLineSlow();
    double _value1 = _indi[_shift][_line_fast];
    double _value2 = _indi[_shift][_line_slow];
    switch (_cmd) {
      case ORDER_TYPE_BUY:
        // Buy signal.
        _result &= _indi.IsIncreasing(1, _line_fast, _shift);
        _result &= _indi[_shift][_line_fast] > _indi[_shift][_line_slow];
        _result &= _indi[_shift + 1][_line_fast] < _indi[_shift + 1][_line_slow];
        _result &= Math::ChangeInPct(_indi[_shift + 1][_line_fast], _indi[_shift][_line_fast], true) > _level;
        if (_result && _method != 0) {
          _result &= _indi[_shift + 3][_line_fast] < _indi[_shift + 3][_line_slow];
          if (METHOD(_method, 1))
            _result &= fmax4(_indi[_shift][_line_fast], _indi[_shift + 1][_line_fast], _indi[_shift + 2][_line_fast],
                             _indi[_shift + 3][_line_fast]) == _indi[_shift][_line_fast];
        }
        break;
      case ORDER_TYPE_SELL:
        // Sell signal.
        _result &= _indi.IsDecreasing(1, _line_fast, _shift);
        _result &= _indi[_shift][_line_fast] < _indi[_shift][_line_slow];
        _result &= _indi[_shift + 1][_line_fast] > _indi[_shift + 1][_line_slow];
        _result &= Math::ChangeInPct(_indi[_shift + 1][_line_fast], _indi[_shift][_line_fast], true) < _level;
        if (_result && _method != 0) {
          if (METHOD(_method, 0)) _result &= _indi[_shift + 3][_line_fast] > _indi[_shift + 3][_line_slow];
          if (METHOD(_method, 1))
            _result &= fmin4(_indi[_shift][_line_fast], _indi[_shift + 1][_line_fast], _indi[_shift + 2][_line_fast],
                             _indi[_shift + 3][_line_fast]) == _indi[_shift][_line_fast];
        }
        break;
    }
    return _result;
  }
};
