trigger QualityJobTrigger on Quality_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityJobHandler.handleAfterDelete(Trigger.old);
    }
}
