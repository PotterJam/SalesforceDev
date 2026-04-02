trigger TrainingPluginTrigger on Training_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingPluginHandler.handleAfterDelete(Trigger.old);
    }
}
