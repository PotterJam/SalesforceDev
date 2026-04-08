trigger QualityDetailTrigger on Quality_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityDetailHandler.handleAfterDelete(Trigger.old);
    }
}
