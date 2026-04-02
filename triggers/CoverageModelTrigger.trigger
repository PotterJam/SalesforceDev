trigger CoverageModelTrigger on Coverage_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageModelHandler.handleAfterDelete(Trigger.old);
    }
}
