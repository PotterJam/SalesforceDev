trigger RatioViewTrigger on Ratio_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioViewHandler.handleAfterDelete(Trigger.old);
    }
}
