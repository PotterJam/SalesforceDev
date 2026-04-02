trigger QualityViewTrigger on Quality_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityViewHandler.handleAfterDelete(Trigger.old);
    }
}
