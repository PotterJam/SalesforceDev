trigger SalesStageTrigger on Sales_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesStageHandler.handleAfterDelete(Trigger.old);
    }
}
