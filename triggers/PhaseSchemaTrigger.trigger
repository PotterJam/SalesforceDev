trigger PhaseSchemaTrigger on Phase_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
