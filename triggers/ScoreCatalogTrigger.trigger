trigger ScoreCatalogTrigger on Score_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
