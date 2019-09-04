// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stock _$StockFromJson(Map<String, dynamic> json) {
  return Stock()
    ..remainingStockForTomorrowWorkByAgent = (json['remaining_stock_for_tomorrow_work_by_agent'] as num)?.toDouble()
    ..totalRemainStock = (json['totalRemainStock'] as num)?.toDouble()
    ..stockTeamLeaderTakingBackFromByAgent = (json['remainStockTeamLeader'] as num)?.toDouble()
    ..totalTopup = (json['totalTopup'] as num)?.toDouble()
    ..totalDistribution = (json['totalDistribution'] as num)?.toDouble()
    ..remainStockTeamLeaderForToday = (json['remainStockTLFT'] as num)?.toDouble()
    ..totalStockReturnTeamLeaderTakingBackToday = (json['totalStockReturnTLBT'] as num)?.toDouble()
    ..totalStockAllocatedToAllAgent =
        (json['totalStockAllocatedTAA'] as num)?.toDouble()
    ..stockDeliveredBackToAssistant = (json['stockDeliveredBTA'] as num)?.toDouble()
    ..simStockReceivedByAssistant = (json['simStockReceivedBA'] as num)?.toDouble()
    ..remainStockTeamLeaderFromYesterday = (json['remainStockTLFY'] as num)?.toDouble()
    ..initialStockInHandForTeamLeader = (json['initialStockInHandFTL'] as num)?.toDouble()
    ..stockReturnFromAgentToday =
        (json['stockReturnFromAgentToday'] as num)?.toDouble()
    ..stockTopUpDuringTodayWork = (json['stockTopupDTW'] as num)?.toDouble()
    ..stockInHandBeforeTodayWork = (json['stockInHandBTW'] as num)?.toDouble()
    ..topup = (json['topup'] as num)?.toDouble()
    ..topUpAmount = (json['daily_top_up_amount'] as num)?.toDouble()
    ..simDistribution = (json['simDistribution'] as num)?.toDouble();
}

Map<String, dynamic> _$StockToJson(Stock instance) => <String, dynamic>{
      'remainStockFTWWA': instance.remainingStockForTomorrowWorkByAgent,
      'totalRemainStock': instance.totalRemainStock,
      'remainStockTeamLeader': instance.stockTeamLeaderTakingBackFromByAgent,
      'totalTopup': instance.totalTopup,
      'totalDistribution': instance.totalDistribution,
      'remainStockTLFT': instance.remainStockTeamLeaderForToday,
      'totalStockReturnTLBT': instance.totalStockReturnTeamLeaderTakingBackToday,
      'totalStockAllocatedTAA': instance.totalStockAllocatedToAllAgent,
      'stockDeliveredBTA': instance.stockDeliveredBackToAssistant,
      'simStockReceivedBA': instance.simStockReceivedByAssistant,
      'remainStockTLFY': instance.remainStockTeamLeaderFromYesterday,
      'initialStockInHandFTL': instance.initialStockInHandForTeamLeader,
      'stockReturnFromAgentToday': instance.stockReturnFromAgentToday,
      'stockTopupDTW': instance.stockTopUpDuringTodayWork,
      'stockInHandBTW': instance.stockInHandBeforeTodayWork,
      'topup': instance.topup,
      'simDistribution': instance.simDistribution,
      'daily_top_up_amount': instance.topUpAmount
    };
