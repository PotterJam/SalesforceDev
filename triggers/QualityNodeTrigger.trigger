trigger QualityNodeTrigger on Quality_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityNodeHandler.handleAfterDelete(Trigger.old);
    }
}
