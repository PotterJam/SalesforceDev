trigger MilestoneBridgeTrigger on Milestone_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestoneBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestoneBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
