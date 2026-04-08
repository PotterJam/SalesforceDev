trigger QualityManagerTrigger on Quality_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityManagerHandler.handleAfterDelete(Trigger.old);
    }
}
